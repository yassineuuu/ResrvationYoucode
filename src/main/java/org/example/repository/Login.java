package org.example.repository;

import org.example.dbConnection.HibernateUtil;
import org.example.models.Utilisateur;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

@Component
public class Login {

	public Utilisateur login(String user) {

        //Connection
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction ts = session.beginTransaction();

        //get user from database
    	Utilisateur utilisateur = (Utilisateur) session.createQuery("From utilisateur Where email = :email").setParameter("email", user).uniqueResult();
        
        ts.commit();
        session.close();
        
        return utilisateur;
	}

}
