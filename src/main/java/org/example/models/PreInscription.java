package org.example.models;


import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class PreInscription implements Serializable{

	/**********
	 * Attributes
	 *************/
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idUtilisateur;
	
	private String email;
	private String mdp;
	private String tel;
	
	private String nom;
	private String prenom;
	
	private String statu;

	
	/*************
	 * Constructors
	 ***************/
	
	public PreInscription() {
	}
	
	public PreInscription(String email, String mdp, String tel, String nom, String prenom) {
		this.email = email;
		this.mdp = mdp;
		this.tel = tel;
		this.nom=nom;
		this.prenom=prenom;
		this.statu = "En attent";
	}

	
	
	
	/******************
	 * Getters & Setters
	 *******************/
	
	public String getNom() {
		return nom;
	}


	public Long getIdUtilisateur() {
		return idUtilisateur;
	}

	public void setIdUtilisateur(Long idUtilisateur) {
		this.idUtilisateur = idUtilisateur;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMdp() {
		return mdp;
	}

	public void setMdp(String mdp) {
		this.mdp = mdp;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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

	public String getStatu() {
		return statu;
	}

	public void setStatu(String statu) {
		this.statu = statu;
	}
	
	

}
