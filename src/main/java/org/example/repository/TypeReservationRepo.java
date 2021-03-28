package org.example.repository;

import org.example.dbConnection.HibernateUtil;
import org.example.models.TypeReservation;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class TypeReservationRepo {
	
	
	public TypeReservation getByTr(String tr) {
		//Start Session
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
      //Begin Transaction
        Transaction ts = session.beginTransaction();
        
        //Execute the opération
        TypeReservation typeRes = session.createQuery("From TypeReservation T WHERE T.type_reservation = :tr ", TypeReservation.class).setParameter("tr", tr).uniqueResult();
        
        //Commit the Transaction
        ts.commit();
        
      //close the Session
        session.close();
        
        return typeRes;
	}
}
