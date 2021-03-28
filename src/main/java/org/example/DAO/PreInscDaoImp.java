package org.example.DAO;

import java.util.List;

import org.example.dbConnection.HibernateUtil;
import org.example.models.Apprenant;
import org.example.models.PreInscription;
import org.example.models.UtilisateurRole;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class PreInscDaoImp implements ApprenantDao<PreInscription> {

	/*********************
	 *** Get PreInscription ***
	 **********************/
	@Override
	public PreInscription getById(long id) {
		//Start Session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
      //Begin Transaction
        Transaction ts = session.beginTransaction();
        
        //Execute the opération
        PreInscription apprenant = session.get(PreInscription.class, id);
        
        //Commit the Transaction
        ts.commit();
        
      //close the Session
        session.close();
        
        return apprenant;
	}

	
	/*************************
	 *** Get All PreInscriptions ***
	*************************/
	@Override
	public List<PreInscription> getAll() {
		//Creat a list where we can put the objects
		List<PreInscription> apprenants;
		
		//Start Session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
      //Begin Transaction
        Transaction ts = session.beginTransaction();
        
      //Execute the opération
        Query<PreInscription> query = session.createQuery("SELECT A From PreInscription A ORDER BY A.nom asc ",PreInscription.class);
        apprenants = query.getResultList();
        
      //Commit the Transaction
        ts.commit();
        
      //close the Session
        session.close();
        
        return apprenants;
	}

	
	/*********************
	 *** Add PreInscription ***
	 **********************/
	@Override
	public void save(PreInscription apprenant) {
		//Start Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		//Begin Transaction
		Transaction tsTransaction = session.beginTransaction();
		
		//Set the role of the apprenant to make it return "Apprenant" instead of null
		//UtilisateurRole role = session.get(UtilisateurRole.class, 1L);
		//apprenant.setRole(role);
		
		//Execute the opération
		session.persist(apprenant);
		
		//Commit the Transaction
		tsTransaction.commit();
		
		//close the Session
		session.close();		
	}

	/*************************
	 *** update PreInscription ***
	 *************************/
	@Override
	public void update(PreInscription apprenant) {
		//Start Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		//Begin Transaction
		Transaction tsTransaction = session.beginTransaction();
				
		//Execute the opération
		session.update(apprenant);
		
		//Commit the Transaction
		tsTransaction.commit();
		
		//close the Session
		session.close();		
	}

	
	/************************
	 *** Delete PreInscription ***
	 ************************/
	@Override
	public void delete(PreInscription apprenant) {
		//Start Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		//Begin Transaction
		Transaction tsTransaction = session.beginTransaction();
				
		//Execute the opération
        session.delete(apprenant);
        
        //Commit the Transaction
		tsTransaction.commit();
		
		//close the Session
		session.close();
		
        System.out.println("deleted successfuly");		
	}

}
