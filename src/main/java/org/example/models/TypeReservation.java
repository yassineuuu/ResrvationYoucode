package org.example.models;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TypeReservation implements Serializable {

	/**********
	 * Attributes
	 *************/
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id_tr;
	private String type_reservation;

	
	
	/*************
	 * Constructors
	 ***************/
	public TypeReservation() {
		
	}
	
		public TypeReservation(long id_tr, String type_reservation) {
		this.id_tr = id_tr;
		this.type_reservation = type_reservation;
	}
	
	/******************
	 * Getters & Setters
	 *******************/
	public long getId_tr() {
		return id_tr;
	}
	public void setId_tr(long id_tr) {
		this.id_tr = id_tr;
	}
	public String getType_reservation() {
		return type_reservation;
	}
	public void setType_reservation(String type_reservation) {
		this.type_reservation = type_reservation;
	}
}
