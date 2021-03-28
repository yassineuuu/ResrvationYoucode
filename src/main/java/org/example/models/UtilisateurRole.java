package org.example.models;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class UtilisateurRole implements Serializable{

	/**********
	 * Attributes
	 *************/
	@Id
	private long id_role;
	
	private String role;

	
	/*************
	 * Constructors
	 ***************/
	
	public UtilisateurRole() {
	}
	
	
	/******************
	 * Getters & Setters
	 *******************/
	
		public long getId_role() {
			return id_role;
		}
	
	
		public void setId_role(long id_role) {
			this.id_role = id_role;
		}
	
	
		public String getRole() {
			return role;
		}
	
	
		public void setRole(String role) {
			this.role = role;
		}
}
