package org.example.DAO;

import java.util.List;

public interface ReservationDao<T> {
	
	T getById(long id);
    
    List<T> getAll();
    
    void save(T t);
    
    void update(T t);
    
    void delete(T t);
}
