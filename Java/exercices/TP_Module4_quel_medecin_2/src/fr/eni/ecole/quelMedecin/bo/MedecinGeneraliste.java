package fr.eni.ecole.quelMedecin.bo;

public class MedecinGeneraliste {
	
	
	Adresse adresse;
	
	private String nom;
	private String prenom;
	private String numeroDeTelephone;
	
	static int tarif;
	
	//initialisation de variable static a la compilation a valeur par defaut si pas précisé
	static {
		tarif = 25;
	}
	
	
	public MedecinGeneraliste(String nom, String prenom, String numeroDeTelephone) {
		this.nom = nom;
		this.prenom = prenom;
		this.numeroDeTelephone = numeroDeTelephone;
	}
	
	public MedecinGeneraliste(String nom, String prenom, String numeroDeTelephone, Adresse adresse) {
		this.nom = nom;
		this.prenom = prenom;
		this.numeroDeTelephone = numeroDeTelephone;
		this.adresse = adresse;
	}

	public String getNom() {
		return nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public String getNumeroDeTelephone() {
		return numeroDeTelephone;
	}

	public void setNumeroDeTelephone(String numeroDeTelephone) {
		 this.numeroDeTelephone = numeroDeTelephone;
	}

	public static int getTarif() {
		return tarif;
	}

	public static void setTarif(int tarif) {
		MedecinGeneraliste.tarif = tarif;
	}
	
	public void afficher() {
		System.out.println("Medecin Généraliste: "+ nom +" "+ prenom + " tel:"+numeroDeTelephone+"\n"+tarif+"euro");
		System.out.println(adresse.toString());
	}

}
