package org.example.DAO;

import java.util.List;

import org.example.dbConnection.HibernateUtil;
import org.example.models.TypeReservation;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class TypeReservationImp implements TypeReservtionDao<TypeReservation> {

	@Override
	public TypeReservation getById(long id) {
		//Start Session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
      //Begin Transaction
        Transaction ts = session.beginTransaction();
        
        //Execute the opération
        TypeReservation tr = session.get(TypeReservation.class, id);
        
        //Commit the Transaction
        ts.commit();
        
      //close the Session
        session.close();
        
        return tr;
	}

	@Override
	public List<TypeReservation> getAll() {
		//Creat a list where we can put the objects
		List<TypeReservation> trs;
		
		//Start Session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
      //Begin Transaction
        Transaction ts = session.beginTransaction();
        
      //Execute the opération
        Query<TypeReservation> query = session.createQuery("SELECT T From TypeReservtion T ",TypeReservation.class);
        trs = query.getResultList();
        
      //Commit the Transaction
        ts.commit();
        
      //close the Session
        session.close();
        
        return trs;
	}

	@Override
	public void save(TypeReservation tr) {
		//Start Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		//Begin Transaction
		Transaction tsTransaction = session.beginTransaction();

		//Execute the opération
		session.save(tr);
		
		//Commit the Transaction
		tsTransaction.commit();
		
		//close the Session
		session.close();					
	}

	@Override
	public void update(TypeReservation tr) {
		//Start Session
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		//Begin Transaction
		Transaction tsTransaction = session.beginTransaction();
				
		//Execute the opération
		session.update(tr);
		
		//Commit the Transaction
		tsTransaction.commit();
		
		//close the Session
		session.close();			
	}

	@Override
	public void delete(TypeReservation tr) {
		//Start Session
				Session session = HibernateUtil.getSessionFactory().openSession();
				
				//Begin Transaction
				Transaction tsTransaction = session.beginTransaction();
						
				//Execute the opération
		        session.delete(tr);
		        
		        //Commit the Transaction
				tsTransaction.commit();
				
				//close the Session
				session.close();
				
		        System.out.println("deleted successfuly");				
	}

}
