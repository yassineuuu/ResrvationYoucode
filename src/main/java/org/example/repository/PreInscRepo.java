package org.example.repository;

import java.util.List;

import org.example.dbConnection.HibernateUtil;
import org.example.models.PreInscription;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

public class PreInscRepo {

	
	public static List<PreInscription> getAllByStatu() {
		//Creat a list where we can put the objects
		List<PreInscription> apprenants;
		
		//Start Session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
      //Begin Transaction
        Transaction ts = session.beginTransaction();
        
      //Execute the opération
        Query<PreInscription> query = session.createQuery("SELECT A From PreInscription A WHERE A.statu = 'En attent' ORDER BY A.nom asc ",PreInscription.class);
        apprenants = query.getResultList();
        
      //Commit the Transaction
        ts.commit();
        
      //close the Session
        session.close();
        
        return apprenants;
	}
	
}
