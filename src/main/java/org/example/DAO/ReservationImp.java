package org.example.DAO;

import java.util.List;

import org.example.dbConnection.HibernateUtil;
import org.example.models.Reservation;
import org.example.models.TypeReservation;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ReservationImp implements ReservationDao<Reservation> {

	@Override
	public Reservation getById(long id) {
		//Start Session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
      //Begin Transaction
        Transaction ts = session.beginTransaction();
        
        //Execute the opération
        Reservation r = session.get(Reservation.class, id);
        
        //Commit the Transaction
        ts.commit();
        
      //close the Session
        session.close();
        
        return r;
	}

	@Override
	public List<Reservation> getAll() {
		//Creat a list where we can put the objects
		List<Reservation> reservations;
		
		//Start Session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
      //Begin Transaction
        Transaction ts = session.beginTransaction();
        
      //Execute the opération
        Query<Reservation> query = session.createQuery("SELECT R From Reservation R ORDER BY R.date DESC",Reservation.class);
        reservations = query.getResultList();
        
      //Commit the Transaction
        ts.commit();
        
      //close the Session
        session.close();
        
        return reservations;
	}

	@Override
	public void save(Reservation reservation) {
		// TODO Auto-gen		//Start Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		//Begin Transaction
		Transaction tsTransaction = session.beginTransaction();

		//Execute the opération
		session.save(reservation);
		
		//Commit the Transaction
		tsTransaction.commit();
		
		//close the Session
		session.close();
		
	}

	@Override
	public void update(Reservation reservation) {
		//Start Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		//Begin Transaction
		Transaction tsTransaction = session.beginTransaction();
				
		//Execute the opération
		session.update(reservation);
		
		//Commit the Transaction
		tsTransaction.commit();
		
		//close the Session
		session.close();				
	}

	@Override
	public void delete(Reservation reservation) {
		//Start Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		//Begin Transaction
		Transaction tsTransaction = session.beginTransaction();
				
		//Execute the opération
        session.delete(reservation);
        
        //Commit the Transaction
		tsTransaction.commit();
		
		//close the Session
		session.close();
		
        System.out.println("deleted successfuly");						
	}

}
