package org.example.models;

import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "reservation")
public class Reservation {

	/**********
	 * Attributes
	 *************/
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id_reservation;
	@ManyToOne
	@JoinColumn(referencedColumnName = "id_utilisateur")
	private Apprenant id_apprenant;
	private LocalDate date;
	private String confirmé;
	@ManyToOne
	@JoinColumn(referencedColumnName = "type_reservation")
	private TypeReservation type_reservation;

	
	
	/*************
	 * Constructors
	 ***************/
		public Reservation() {
	}
		
		
	public Reservation(Apprenant id_apprenant, LocalDate date, TypeReservation type_reservation) {
		this.id_apprenant = id_apprenant;
		this.date = date;
		this.type_reservation = type_reservation;
		this.confirmé="En attent";
	}


	/******************
	 * Getters & Setters
	 *******************/
		
		public long getId_reservation() {
			return id_reservation;
		}



		public void setId_reservation(long id_reservation) {
			this.id_reservation = id_reservation;
		}



		public Apprenant getId_apprenant() {
			return id_apprenant;
		}



		public void setId_apprenant(Apprenant id_apprenant) {
			this.id_apprenant = id_apprenant;
		}



		public LocalDate getDate() {
			return date;
		}



		public void setDate(LocalDate date) {
			this.date = date;
		}


		public String getConfirmé() {
			return confirmé;
		}


		public void setConfirmé(String confirmé) {
			this.confirmé = confirmé;
		}



		public TypeReservation getType_reservation() {
			return type_reservation;
		}



		public void setType_reservation(TypeReservation type_reservation) {
			this.type_reservation = type_reservation;
		}
		
}
