package org.example.repository;

import java.util.List;

import org.example.dbConnection.HibernateUtil;
import org.example.models.Apprenant;
import org.example.models.Reservation;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ReservationHistory {
	
	//Get Reservation by User
	public static List<Reservation> getAll(Apprenant id_utilisateur) {
		//Creat a list where we can put the objects
		List<Reservation> reservations;
		
		//Start Session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
      //Begin Transaction
        Transaction ts = session.beginTransaction();
        
      //Execute the opération
        Query<Reservation> query = session.createQuery("SELECT R From Reservation R WHERE R.id_apprenant= :id ORDER BY R.date DESC",Reservation.class).setParameter("id", id_utilisateur);
        reservations = query.getResultList();
        
      //Commit the Transaction
        ts.commit();
        
      //close the Session
        session.close();
        
        return reservations;
	}
	
	//Get Reservation by User
	public static List<Reservation> getAllByWeek() {
		//Creat a list where we can put the objects
		List<Reservation> reservations;
		
		//Start Session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
      //Begin Transaction
        Transaction ts = session.beginTransaction();
        
      //Execute the opération
        Query<Reservation> query = session.createNativeQuery("SELECT*From Reservation R WHERE EXTRACT(DAY FROM R.date) = EXTRACT(DAY FROM now()) ORDER BY R.date ASC LIMIT 30",Reservation.class);
        reservations = query.getResultList();
        
      //Commit the Transaction
        ts.commit();
        
      //close the Session
        session.close();
        
        return reservations;
	}
}
