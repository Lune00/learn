package fr.eni.ecole.quelMedecin.bo;

public class Adresse {
	
	
	String mentionComplementaires;
	int numeroDeLaVoie;
	String voieComplementaire;
	String nomDeLaVoie;
	int codePostal;
	String Ville;
	
	
	
	public Adresse(String mentionComplementaires, int numeroDeLaVoie, String voieComplementaire,
					String nomDeLaVoie, int codePostal, String Ville) {
		this.mentionComplementaires = mentionComplementaires;
		this.numeroDeLaVoie = numeroDeLaVoie;
		this.voieComplementaire = voieComplementaire;
		this.nomDeLaVoie = nomDeLaVoie;
		this.codePostal = codePostal;
		this.Ville = Ville;
	}
	
	
	public Adresse(int numeroDeLaVoie, String voieComplementaire,
			String nomDeLaVoie, int codePostal, String Ville) {
		
		this.mentionComplementaires = null;
		this.numeroDeLaVoie = numeroDeLaVoie;
		this.voieComplementaire = voieComplementaire;
		this.nomDeLaVoie = nomDeLaVoie;
		this.codePostal = codePostal;
		this.Ville = Ville;
		
	}
	
	public void afficher() {
		
		String adresseString = new String();
		
		if( mentionComplementaires != null ) {	
			adresseString += String.format("%s\n",mentionComplementaires );
		}
		if( voieComplementaire != null ) {	
			adresseString += String.format("%s\n",voieComplementaire );
		}
		adresseString += String.format("%d %s\n%05d %s", numeroDeLaVoie, nomDeLaVoie, codePostal, Ville);
		
		System.out.println(adresseString);
	}
	

}
