package fr.eni.ecole.quelMedecin.bo;

import java.time.LocalDate;

public class Patient {

	private String nom;
	private String prenom;
	private String numeroDeTelephone;
	private char sexe;
	private long numeroDeSecuriteSociale;
	private LocalDate dateDeNaissance;
	private String commentaires;

	public Patient(String nom, String prenom, String numeroDeTelephone, char sexe, long numeroDeSecuriteSociale,
			LocalDate dateDeNaissance, String commentaires) {
		this.nom = nom;
		this.prenom = prenom;
		this.numeroDeTelephone = numeroDeTelephone;
		this.sexe = sexe;
		this.numeroDeSecuriteSociale = numeroDeSecuriteSociale;
		this.dateDeNaissance = dateDeNaissance;
		this.commentaires = commentaires;
	}

	// tp@guillaume-balas.fr

	public void afficher() {
		
		System.out.print(nom + " "+ prenom + "\n"+
				" Téléphone: " + numeroDeTelephone + "\n"+
				" Sexe: " + sexe + "\n"+
				" Numéro de sécurité sociale: " + numeroDeSecuriteSociale + "\n"+
				" Date de naissance: " + dateDeNaissance + "\n");
		
		if( commentaires != null) {
		
		
			System.out.println(" Commentaires: " + commentaires);
		}
		else {
			
			System.out.println("[aucun commentaires]");
		}
	
	}

}
