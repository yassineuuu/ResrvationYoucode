package org.example.DAO;

import java.util.List;

import org.example.dbConnection.HibernateUtil;
import org.example.models.Admin;
import org.example.models.UtilisateurRole;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImp implements AdminDao<Admin> {

	/*********************
	 *** Get Admin ***
	 **********************/
	@Override
	public Admin getById(long id) {
		//Start Session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
      //Begin Transaction
        Transaction ts = session.beginTransaction();
        
        //Execute the opération
        Admin admin = session.get(Admin.class, id);
        
        //Commit the Transaction
        ts.commit();
        
      //close the Session
        session.close();
        
        return admin;
	}

	
	/*************************
	 *** get All Admins ***
	*************************/
	@Override
	public List<Admin> getAll() {
		//Creat a list where we can put the objects
				List<Admin> admins;
				
				//Start Session
		        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		        
		      //Begin Transaction
		        Transaction ts = session.beginTransaction();
		        
		      //Execute the opération
		        Query<Admin> query = session.createQuery("SELECT A From Admin A ORDER BY A.nom asc ",Admin.class);
		        admins = query.getResultList();
		        
		      //Commit the Transaction
		        ts.commit();
		        
		      //close the Session
		        session.close();
		        
		        return admins;
	}

	/*********************
	 *** Add Admin ***
	 **********************/
	@Override
	public void save(Admin admin) {
		//Start Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		//Begin Transaction
		Transaction tsTransaction = session.beginTransaction();
		
		//Set the role of the admin to make it return "Admin" instead of null
		UtilisateurRole role = session.get(UtilisateurRole.class, 2L);
		admin.setRole(role);
		
		//Execute the opération
		session.persist(admin);
		
		//Commit the Transaction
		tsTransaction.commit();
		
		//close the Session
		session.close();		
		
	}

	/*********************
	 *** Update Admin ***
	 **********************/
	@Override
	public void update(Admin admin) {
		//Start Session
				Session session = HibernateUtil.getSessionFactory().openSession();
				
				//Begin Transaction
				Transaction tsTransaction = session.beginTransaction();
						
				//Execute the opération
				session.update(admin);
				
				//Commit the Transaction
				tsTransaction.commit();
				
				//close the Session
				session.close();	
		
	}

	/*********************
	 *** Delete Admin ***
	 **********************/
	@Override
	public void delete(Admin admin) {
		//Start Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		//Begin Transaction
		Transaction tsTransaction = session.beginTransaction();
				
		//Execute the opération
        session.delete(admin);
        
        //Commit the Transaction
		tsTransaction.commit();
		
		//close the Session
		session.close();
		
        System.out.println("deleted successfuly");				
	}

}
