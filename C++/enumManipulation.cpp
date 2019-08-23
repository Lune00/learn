#include<iostream>
#include<string>
#include<vector>
#include<map>

using namespace std;

//Attribute est la feature implémentée
struct Attribute{

  std::string name_ ;
  //Valeur double et pour discret cast to int??
  double value_ ;
  //pointeur vers la feature par laquelle il est créee, utile ?
  Attribute(std::string name, int value) {
    name_ = name ;
    value_ = value;
  }
};

//Gere tout le materiel genetique
class Genome{
  public:
  double getAttributeValue(int index);
  void addAttribute(std::string name,int value,int index);
  private:
  std::map<int,Attribute> attributes_ ;
};

void Genome::addAttribute(std::string name, int value, int index) {
  attributes_.insert( std::pair<int,Attribute>( index, Attribute("size",3) ) );
}
double Genome::getAttributeValue(int index){
  std::map<int,Attribute>::iterator it = attributes_.find(index) ;
  if(it!=attributes_.end())
    return it->second.value_ ;
  else return 0. ;
}

class Oiseau : public Genome{
  public:
    //On declare les tags des attributs ainsi que des tags pour le retour des attributs discrets
    enum AttributPhysique{ tailleCorps = 0 , tailleAiles = 1 } ;
    enum TailleAiles{ grande = 0 , petite = 1 };
    Oiseau();
    TailleAiles getWingsSize();
  private:
    //Variable qui stocke le resultat de l'expression des genes d'un attribut discret
    AttributPhysique eAttributPhysique_ ;
};

Oiseau::Oiseau() {
  addAttribute("tailleAiles", 1 , static_cast<int>(AttributPhysique::tailleAiles) ) ;
}

Oiseau::TailleAiles Oiseau::getWingsSize(){
return TailleAiles(getAttributeValue( AttributPhysique::tailleAiles ) ) ;
}


//C++11 : auto ne peut pas inferer le type de retour (C++14 oui)
auto add(int x, int y) ->decltype(x  + y ) {
  return x + y ;
}

int main() {

  //From int to Enum
  //AttributPhysique attributPhysique = AttributPhysique(1.2);
  //if(attributPhysique == AttributPhysique::tailleAiles ) cout << "bingo" << endl ;
  Oiseau oiseau ;
  if( oiseau.getWingsSize() == Oiseau::TailleAiles::petite) cout << "L'oiseau a de petites ailes" << endl ;

  return 0 ;
}


