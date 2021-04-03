package org.example.repository;

import java.security.MessageDigest;
import java.util.Iterator;

import javax.mail.Message;

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

	public static String HashPass(String password) {
		try {
			MessageDigest messageDigest  = MessageDigest.getInstance("MD5");
			messageDigest.update(password.getBytes());
			byte[] result = messageDigest.digest();
			StringBuilder stringBuilder = new StringBuilder();
			for (byte b : result) {
				stringBuilder.append(String.format("%02x", b));
				
			}
			return stringBuilder.toString();
			
		} catch (Exception e) {
				e.printStackTrace();
		}
		return "";
	}
	
}
