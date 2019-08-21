#include<iostream>
#include<set>

//On comprend comment marche un set : principe de la comparaison, intro au fonctor, relation d'equivalence
//
using namespace std;

struct MyStruct{
  std::pair < int , int > pairInt ;
  double coeff ;

  MyStruct() : pairInt(0,0), coeff(1.) {}

  MyStruct(int a) : pairInt(a,a), coeff(1.) {}

  MyStruct(int a , int b ) {
    if ( a < b )
      pairInt = std::make_pair( a , b ) ;
    else 
      pairInt = std::make_pair( b , a ) ;
    coeff = 1. ;
  }
};

//Un set utilise comp comme comparaison. Deux objets a et b sont considérés équivalent si aucun des deux
//n'est plus petit que l'autre. Relation d'équivalence utilisée : !comp(a,b) && !compt(b,a).
//Si a==b alors !comp(a,b) renvoie vrai et !comp(b,a) renvoie vrai, alors l'element b (a est deja dans le set) n'est pas inséré. 

struct MyStructComp {
  bool operator() (const MyStruct& lhs, const MyStruct& rhs) const {
    return ( (lhs.pairInt.first < rhs.pairInt.first) || (lhs.pairInt.second < rhs.pairInt.second) );
  }
};

void addMystructToSet(const MyStruct& myStruct,std::set< MyStruct, MyStructComp >& mySet ) {
  MyStruct myStructFirst ( myStruct.pairInt.first ) ;
  MyStruct myStructSecond ( myStruct.pairInt.second ) ;
  mySet.insert( myStruct ) ;
  mySet.insert( myStructFirst ) ;
  mySet.insert( myStructSecond ) ;
}

int main() {

  cout << "Set of objects and custom compare (on pairs) " << endl ;
  std::set<MyStruct,MyStructComp> mySet ;
  addMystructToSet(MyStruct(1,2),mySet);
  addMystructToSet(MyStruct(3,1),mySet);
  addMystructToSet(MyStruct(1,1),mySet);

  //Ce que fait le set quand il regarde s'il insere un element. Si l'equivalence est vraie alors l'element existe deja dans le set et il n'est pas inséré.
  // Ok ca marche, c'est bien compris.
  MyStruct a(1,2) ;
  MyStruct b(3,2) ;
  bool equivalence_remation = !(MyStructComp()(a,b)) && !(MyStructComp()(b,a)) ;
  cout << equivalence_remation << endl ;

  //Print
  for(std::set<MyStruct,MyStructComp>::iterator it = mySet.begin() ; it != mySet.end() ; it++) {
    cout << it->pairInt.first << " "<< it->pairInt.second << " "<< it->coeff << endl ;
  }

  return 0 ;

}
