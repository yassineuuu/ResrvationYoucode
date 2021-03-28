package org.example.models;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Entity(name = "admin")
@DiscriminatorValue("Admin")
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@PrimaryKeyJoinColumn(name = "id_utilisateur")
public class Admin extends Utilisateur {
	
	/**********
	 * Attributes
	 *************/
	private String Username;

	
	
	/*************
	 * Constructors
	 ***************/
	
	public Admin() {
	}


	
	
	/******************
	 * Getters & Setters
	 *******************/
	

	public String getUsername() {
		return Username;
	}



	public void setUsername(String username) {
		Username = username;
	}

}
