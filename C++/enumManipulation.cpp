#include<iostream>
#include<string>
#include<vector>
#include<map>

//Prototypage de la librairie geneticsLib pour les interfaces

using namespace std;

//Attribute minimal
struct Attribute{
  std::string name_ ;
  int value_ ;
  Attribute(std::string name, int value) {
    name_ = name ;
    value_ = value;
  }
};


//heritera de genetics. 

struct Oiseau {

  //Obligatoire: sert de clef pour stocker les Attribute
  enum class Attributes{wingSize = 0 , plumageColor = 1 } ;
  //Personalisation du retour de la valeur d'un trait discret
  enum class plumageColor{ blue = 0 , black = 1 } ;

  //Stocke tous les attributs que l'on desire ajouter (existe deja dans class genetics)
  std::map<Attributes,Attribute> myMap;

  //D'abord on ajoute les attributs a partir de la base de features abstraites:
  //label(abstract name), name (vrai nom de la feature), Attributes donne un tag a la feature pour la retrouver( sert de clef pour la stocker dans la map). Cette fonction appelera insert. Et creera le materiel genetique necessaire.
  void addAttribute(std::string label, std::string name, Attributes attribute); 

  //On peut ensuite associer la valeur de retour d'un attribut a un enum pour. Une feature qui renvoie 0, 1 ou 2 renverra enum::bleu, enum::noir etc...
  void associateReturnValueToEnum();

  Oiseau(){
    addAttribute("color","plumageColor",Attributes::plumageColor) ;
    associateReturnValueToEnum();
    cout << "L'oiseau a " << myMap.size() << " attributs. " << endl ;
  }

};


void Oiseau::addAttribute(std::string label, std::string name, Attributes attribute) {
  myMap.insert(std::pair<Attributes,Attribute>(attribute,Attribute(name, 0)) );
}


void Oiseau::associateReturnValueToEnum() {
  //On parcourt le map d'Attribut
  //On doit écrire pour chaque Attribute (wingSize, plumageColor etc...) si on veut une valeur interpretee
  //La feature doit changer sa fonction return value. Pas encore sur de cette partie.
  //A mediter!!!!

  cout << myMap.find(Attributes::plumageColor)->second.name_ << endl ;
}

int main() {


  // Apres ce serait bien de pouvoir définir plusieurs enums pour séparer les features pour mieux sy' retrouver du genre
  // enum class Attributes_physique{ taille, couleur des yeux... }
  // enum class Attributes_mental{force_mental, resitance a la folie, ...; }
  // Pour ça il faudrait remplacer la clef de la map par un struct un peu plus dévelopéé. A reflechir. J'arrive pas a trouver de solution a ce probleme
  //On pourra ajouter une fonction qui verifie ca. Chaque appel de insert (ou add) incremente un compteur. Si la taille de la map est differente (inferieure) a celle du compteur alors certaines features n'ont pas été ajoutées. Erreur

  //On stocke dans une map les Attributes d'un individu (dans la classe Genetics pour la lib)
  //std::map<Attributes,Attribute> myMap;
  ////L'idée est d'ajouter un attribut en lui associant une clef(key) 
  //myMap.insert(std::pair<Attributes,Attribute>(Attributes::wingSize,Attribute("wingSize", 0)) );
  //myMap.insert(std::pair<Attributes,Attribute>(Attributes::plumageColor,Attribute("plumageColor", 1)) );


  ////On peut recuperer l'attribut par sa key (issu de Enum Attributes)
  //std::cout << myMap.find(Attributes::wingSize)->second.name_ <<" " << myMap.find(Attributes::wingSize)->second.value_ << '\n';
  //
  //
  Oiseau oiseau ;

  return 0 ;
}
