package org.example.DAO;

import java.util.List;

import org.example.dbConnection.HibernateUtil;
import org.example.models.UtilisateurRole;
import org.example.models.Utilisateur;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class UtilisateurDaoImp implements UtilisateurDao<Utilisateur> {

	@Override
	public Utilisateur getById(long id) {
		//Start Session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
      //Begin Transaction
        Transaction ts = session.beginTransaction();
        
        //Execute the opération
        Utilisateur utilisateur = session.get(Utilisateur.class, id);
        
        //Commit the Transaction
        ts.commit();
        
      //close the Session
        session.close();
        
        return utilisateur;
	}

	@Override
	public List<Utilisateur> getAll() {
		//Creat a list where we can put the objects
				List<Utilisateur> utilisateurs;
				
				//Start Session
		        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		        
		      //Begin Transaction
		        Transaction ts = session.beginTransaction();
		        
		      //Execute the opération
		        Query<Utilisateur> query = session.createQuery("SELECT U From Utilisateur U ORDER BY U.nom asc ",Utilisateur.class);
		        utilisateurs = query.getResultList();
		        
		      //Commit the Transaction
		        ts.commit();
		        
		      //close the Session
		        session.close();
		        
		        return utilisateurs;
	}

	@Override
	public void save(Utilisateur utilisateur) {
		//Start Session
				Session session = HibernateUtil.getSessionFactory().openSession();
				
				//Begin Transaction
				Transaction tsTransaction = session.beginTransaction();
				
				//Set the role of the apprenant to make it return "Apprenant" instead of null
				UtilisateurRole role = session.get(UtilisateurRole.class, 1L);
				utilisateur.setRole(role);
				
				//Execute the opération
				session.persist(utilisateur);
				
				//Commit the Transaction
				tsTransaction.commit();
				
				//close the Session
				session.close();				
	}

	@Override
	public void update(Utilisateur utilisateur) {
		//Start Session
				Session session = HibernateUtil.getSessionFactory().openSession();
				
				//Begin Transaction
				Transaction tsTransaction = session.beginTransaction();
						
				//Execute the opération
				session.update(utilisateur);
				
				//Commit the Transaction
				tsTransaction.commit();
				
				//close the Session
				session.close();			
	}

	@Override
	public void delete(Utilisateur t) {
		// TODO Auto-generated method stub
		
	}

}
