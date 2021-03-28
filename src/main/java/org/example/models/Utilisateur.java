package org.example.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Entity(name = "utilisateur")
@Inheritance(strategy = InheritanceType.JOINED)
//@DiscriminatorColumn(name = "role")
//@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class Utilisateur implements Serializable {
	
	/**********
	 * Attributes
	 *************/
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_utilisateur")
	private Long idUtilisateur;
	
	private String email;
	private String mdp;
	private String tel;
	
	@ManyToOne
	@JoinColumn(name="id_role", referencedColumnName="role")
	private UtilisateurRole role;
	
	
	
	/*************
	 * Constructors
	 ***************/
	public Utilisateur() {
	}

	
	public Utilisateur(String email, String mdp, String tel) {
		this.email = email;
		this.mdp = mdp;
		this.tel = tel;
	}


	/******************
	 * Getters & Setters
	 *******************/

	public Long getId_utilisateur() {
		return idUtilisateur;
	}


	public void setId_utilisateur(Long idUtilisateur) {
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


	public UtilisateurRole getRole() {
		return role;
	}


	public void setRole(UtilisateurRole role) {
		this.role = role;
	}
	
}
