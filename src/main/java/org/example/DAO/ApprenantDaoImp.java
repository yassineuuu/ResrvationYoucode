package org.example.DAO;

import java.util.List;

import org.example.dbConnection.HibernateUtil;
import org.example.models.Apprenant;
import org.example.models.UtilisateurRole;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ApprenantDaoImp implements ApprenantDao<Apprenant> {

	/*********************
	 *** Get Apprenant ***
	 **********************/
	@Override
	public Apprenant getById(long id) {
		//Start Session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
      //Begin Transaction
        Transaction ts = session.beginTransaction();
        
        //Execute the opération
        Apprenant apprenant = session.get(Apprenant.class, id);
        
        //Commit the Transaction
        ts.commit();
        
      //close the Session
        session.close();
        
        return apprenant;
	}

	
	/*************************
	 *** Get All Apprenants ***
	*************************/
	@Override
	public List<Apprenant> getAll() {
		//Creat a list where we can put the objects
		List<Apprenant> apprenants;
		
		//Start Session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
      //Begin Transaction
        Transaction ts = session.beginTransaction();
        
      //Execute the opération
        Query<Apprenant> query = session.createQuery("SELECT A From Apprenant A ORDER BY A.nom asc ",Apprenant.class);
        apprenants = query.getResultList();
        
      //Commit the Transaction
        ts.commit();
        
      //close the Session
        session.close();
        
        return apprenants;
	}

	
	/*********************
	 *** Add Apprenant ***
	 **********************/
	@Override
	public void save(Apprenant apprenant) {
		//Start Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		//Begin Transaction
		Transaction tsTransaction = session.beginTransaction();
		
		//Set the role of the apprenant to make it return "Apprenant" instead of null
		UtilisateurRole role = session.get(UtilisateurRole.class, 1L);
		apprenant.setRole(role);
		
		//Execute the opération
		session.persist(apprenant);
		
		//Commit the Transaction
		tsTransaction.commit();
		
		//close the Session
		session.close();		
	}

	/*************************
	 *** update Apprenant ***
	 *************************/
	@Override
	public void update(Apprenant apprenant) {
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
	 *** Delete Apprenant ***
	 ************************/
	@Override
	public void delete(Apprenant apprenant) {
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
