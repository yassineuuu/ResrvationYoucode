package org.example.controller;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.time.LocalDate;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.example.DAO.AdminDaoImp;
import org.example.DAO.ApprenantDaoImp;
import org.example.DAO.PreInscDaoImp;
import org.example.DAO.ReservationImp;
import org.example.DAO.RoleDaoImp;
import org.example.DAO.TypeReservationImp;
import org.example.DAO.UtilisateurDaoImp;
import org.example.dbConnection.HibernateUtil;
import org.example.models.Admin;
import org.example.models.Apprenant;
import org.example.models.PreInscription;
import org.example.models.Reservation;
import org.example.models.TypeReservation;
import org.example.models.Utilisateur;
import org.example.models.UtilisateurRole;
import org.example.repository.Login;
import org.example.repository.ReservationHistory;
import org.example.repository.TypeReservationRepo;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	UtilisateurDaoImp utilisateurDaoImp = new UtilisateurDaoImp();
	AdminDaoImp adminDaoImp = new AdminDaoImp();
	ApprenantDaoImp apprenantDaoImp = new ApprenantDaoImp();
	RoleDaoImp roleImp = new RoleDaoImp();
	TypeReservationRepo tri = new TypeReservationRepo();
	ReservationImp reserv = new ReservationImp();
	PreInscDaoImp preInscription = new PreInscDaoImp();

	
	
	@RequestMapping(value = "/Dashboard")
	public ModelAndView userLogin(HttpServletRequest request, HttpServletResponse response, Model model) {

		if (request.getParameter("id_accepteInscription") !=null) {
			long insc_Id=Long.parseLong( request.getParameter("id_accepteInscription"));
			Utilisateur utilisateur = utilisateurDaoImp.getById((Long) request.getSession().getAttribute("id"));
			PreInscription apprenant= preInscription.getById(insc_Id);
			apprenantDaoImp.save(new Apprenant(apprenant.getEmail(), apprenant.getMdp(), apprenant.getTel(), apprenant.getNom(),apprenant.getPrenom()));
			preInscription.delete(apprenant);
			System.out.println("Done");
			return userGet(utilisateur, request, response, model);
			
		}else if (request.getParameter("id_rejectInscription") !=null) {
			long insc_Id=Long.parseLong( request.getParameter("id_rejectInscription"));
			System.out.println((Long) request.getSession().getAttribute("id"));
			Utilisateur utilisateur = utilisateurDaoImp.getById((Long) request.getSession().getAttribute("id"));
			PreInscription apprenant= preInscription.getById(insc_Id);
			preInscription.delete(apprenant);
			System.out.println("Done");
			return userGet(utilisateur, request, response, model);
			
		}else {

			String user = request.getParameter("user");
			String password = request.getParameter("pass");

			//Implimentation
			Login login = new Login();
			//Get The User
			Utilisateur utilisateur = login.login(user);
			//Store the User into the model
			model.addAttribute("utilisateur", utilisateur);
			//Check the Email
			if (utilisateur != null) {
				//Check the Password
				if(utilisateur.getMdp().equals(password)) {
					HttpSession hSession = request.getSession();
					hSession.setAttribute("id", utilisateur.getId_utilisateur());
					hSession.setAttribute("email", utilisateur.getEmail());
					hSession.setAttribute("pass", utilisateur.getMdp());
					
					return userGet(utilisateur, request, response, model);
					
				}else {
					//if the password is wrong
					System.out.println("mdp error");
					return new ModelAndView("../../index");
				}
			}else {
				//if the Email  is wrong
				System.out.println("email error");
				return new ModelAndView("../../index");
			}
			
			


	}
	}
	@RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request) {
        System.out.println("logout()");
        HttpSession httpSession = request.getSession();
        httpSession.invalidate();
        return "../../index";
    }
	
	
	
	
	@RequestMapping(value="/addApprenant")
	public String addApprenant(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {

		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String mdp = request.getParameter("mdp");
		
		
		
		PreInscription apprenant = new PreInscription(email,mdp, tel,nom,prenom);
		//apprenant.setRole(roleImp.getById(1L));
		
		preInscription.save(apprenant);
		model.addAttribute("apprenant", apprenant);

		return "home";
	}
	
	
	
	
	
	@RequestMapping(value="/inscription")
	public ModelAndView test(HttpServletResponse response, Model model){
				
		Apprenant apprenant = new Apprenant();
		model.addAttribute("apprenant", apprenant);
		
		return new ModelAndView("inscription");
	}

	
	
	
	
	@RequestMapping(value="/reservation")
	public ModelAndView test(@ModelAttribute("apprenant")Apprenant apprenant , HttpServletResponse response, HttpServletRequest request, Model model) throws ServletException, IOException{
		HttpSession hSession = request.getSession(false);
		Number id=(Number) hSession.getAttribute("id");

		
		TypeReservation tReservation = tri.getByTr(request.getParameter("t_reservation"));
//		model.addAttribute("tReservation", tReservation);
		apprenant= apprenantDaoImp.getById((Long) id);
		model.addAttribute("apprenant", apprenant);
		
		
		LocalDate date =LocalDate.parse(request.getParameter("date"));
		Reservation reservation = new Reservation(apprenant, date, tReservation);
		reserv.save(reservation);
		System.out.println(reservation.getId_reservation());
		System.out.println(reservation.getDate());
		System.out.println(reservation.getType_reservation());

        List<Reservation> reservations = ReservationHistory.getAll(apprenantDaoImp.getById(apprenant.getId_utilisateur()));

		model.addAttribute("reservation", reservations);
		
		return new ModelAndView("Apprenant");
		
	}
	
	
	
	@RequestMapping("/History")
	public ModelAndView historique(@ModelAttribute("apprenant")Apprenant apprenant, HttpServletRequest request, HttpServletResponse response, Model model){
		HttpSession hSession = request.getSession(false);

        List<Reservation> reservations = reserv.getAll();
		model.addAttribute("reservation", reservations);

		return new ModelAndView("history");
	}
	
	@RequestMapping("/dayReservation")
	public ModelAndView historique( HttpServletRequest request, HttpServletResponse response, Model model){
		HttpSession hSession = request.getSession();


		
		if (request.getParameter("weekReservation").equalsIgnoreCase("smtn")) {
	        List<Reservation> reservations = ReservationHistory.getAllByWeek();
	        for (int i =0;i< reservations.size(); i++) {
	        	Reservation reservation = reservations.get(i);
				System.out.println(hSession.getAttribute("id"));
	        	reservation.setConfirmé("Oui");
	        	reserv.update(reservation);
			}
			System.out.println("woaw");
			model.addAttribute("reservation", reservations);
			return new ModelAndView("dayReservation");
		}
		return new ModelAndView("dayReservation");
	}
	

	public ModelAndView userGet(Utilisateur utilisateur, HttpServletRequest request, HttpServletResponse response, Model model) {
		//if User is Admin
		if (utilisateur.getRole().getRole().equals("Admin")) {
			
//			user = utilisateur.getEmail();
//			password = utilisateur.getMdp();
			Admin admin =adminDaoImp.getById((long)utilisateur.getId_utilisateur()); 
			
	        List<Reservation> reservations = ReservationHistory.getAllByWeek();
	        List<PreInscription> preInsc = preInscription.getAll();

			model.addAttribute("reservation", reservations);					
			model.addAttribute("preInsc", preInsc);					
			model.addAttribute("admin", admin);

			
		}
		//if User is Apprenant
		else if (utilisateur.getRole().getRole().equals("Apprenant")) {
			Apprenant apprenant =apprenantDaoImp.getById((long)utilisateur.getId_utilisateur()); 
			
	        List<Reservation> reservations = ReservationHistory.getAll(apprenantDaoImp.getById(apprenant.getId_utilisateur()));

			model.addAttribute("reservation", reservations);
			
			System.out.println(reserv.getAll().get(0).getId_reservation());
			model.addAttribute("apprenant", apprenant);
		}
		return new ModelAndView(utilisateur.getRole().getRole());
		
	
		
	}
	
}
