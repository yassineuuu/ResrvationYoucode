package org.example.DAO;

import java.util.List;

import org.example.dbConnection.HibernateUtil;
import org.example.models.UtilisateurRole;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class RoleDaoImp implements RoleDao<UtilisateurRole> {

	/*********************
	 		*** Get Role ***
	 **********************/
	@Override
	public UtilisateurRole getById(long id) {
		//Start Session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
      //Begin Transaction
        Transaction ts = session.beginTransaction();
        
        //Execute the opération
        UtilisateurRole role = session.get(UtilisateurRole.class, id);
        
        //Commit the Transaction
        ts.commit();
        
      //close the Session
        session.close();
        
        return role;
	}
	
	/*************************
	 *** get All Roles ***
	*************************/
	@Override
	public List<UtilisateurRole> getAll() {
		//Creat a list where we can put the objects
		List<UtilisateurRole> roles;
		
		//Start Session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
      //Begin Transaction
        Transaction ts = session.beginTransaction();
        
      //Execute the opération
        Query<UtilisateurRole> query = session.createQuery("SELECT R From Role R ORDER BY R.role asc ",UtilisateurRole.class);
        roles = query.getResultList();
        
      //Commit the Transaction
        ts.commit();
        
      //close the Session
        session.close();
        
        return roles;
	}

	/*********************
		*** Add Role ***
	**********************/
	@Override
	public void save(UtilisateurRole role) {
		//Start Session
				Session session = HibernateUtil.getSessionFactory().openSession();
				
				//Begin Transaction
				Transaction tsTransaction = session.beginTransaction();			
				
				//Execute the opération
				session.persist(role);
				
				//Commit the Transaction
				tsTransaction.commit();
				
				//close the Session
				session.close();		
						
	}

	/*********************
		*** Update Role ***
		**********************/
	@Override
	public void update(UtilisateurRole role) {
		//Start Session
				Session session = HibernateUtil.getSessionFactory().openSession();
				
				//Begin Transaction
				Transaction tsTransaction = session.beginTransaction();
						
				//Execute the opération
				session.update(role);
				
				//Commit the Transaction
				tsTransaction.commit();
				
				//close the Session
				session.close();				
	}

	/*********************
		*** Delete Role ***
	**********************/
	@Override
	public void delete(UtilisateurRole role) {
		// TODO Auto-generated method stub
		
	}

}
