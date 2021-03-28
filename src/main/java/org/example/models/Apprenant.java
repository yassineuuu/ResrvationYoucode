package org.example.models;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Entity(name = "apprenant")
@DiscriminatorValue("Apprenant")
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class Apprenant extends Utilisateur {

	/**********
	 * Attributes
	 *************/
	private String nom;

	private String prenom;

	
	/*************
	 * Constructors
	 ***************/
	
	public Apprenant() {
	}
	
	public Apprenant(String email, String mdp, String tel, String nom, String prenom) {
		super(email, mdp, tel);
		this.nom=nom;
		this.prenom=prenom;
	}

	/******************
	 * Getters & Setters
	 *******************/

	public String getNom() {
		return nom;
	}


	public void setNom(String nom) {
		this.nom = nom;
	}


	public String getPrenom() {
		return prenom;
	}


	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	
	

}
