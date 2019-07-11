#include<iostream>
#include<unordered_set>
#include <boost/functional/hash.hpp>

//We try to build a unordered set based on pair<int,int> for the hash function

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

  //Ici je peux definir == comme pair(a,b) = pair(b,a) et en stocker qu'une
  //Je fais d'abord un rangement croissant, tout struct ajouter est classé comme ça
  
  MyStruct(int a , int b, double c ) {

    coeff = c ;

    if ( a < b )
      pairInt = std::make_pair( a , b ) ;
    else 
      pairInt = std::make_pair( b , a ) ;

  }

  bool operator==(const MyStruct& other) const {
    if( pairInt == other.pairInt ) 
      return true;
    else
      return false;
  }
};


struct MyStructHasher
{
  size_t
    operator()(const MyStruct & obj) const
    {
      return boost::hash<std::pair <int, int > >()(obj.pairInt) ;
    }
};


//Tres specifique a mon probleme pour le code genetique. Je voudrais, a chaque fois qu'un ajoute un MyStruct(a,b) que soit automatiquement ajouté un MyStruct(a,a) et un MyStruct(b,b)
void addMystructToSet(const MyStruct& myStruct,std::unordered_set< MyStruct, MyStructHasher >& mySet ) {

  MyStruct myStructFirst ( myStruct.pairInt.first ) ;
  MyStruct myStructSecond ( myStruct.pairInt.second ) ;
  mySet.insert( myStruct ) ;
  mySet.insert( myStructFirst ) ;
  mySet.insert( myStructSecond ) ;

}


int main(){

  cout << "unordered set" << endl;

  std::unordered_set< MyStruct, MyStructHasher > mySet ; 

  //Insert : 
  //mySet.insert(MyStruct(2,1));
  //mySet.insert(MyStruct(3,1,0.5));
  //mySet.insert(MyStruct(1,3,0.2));
  //mySet.insert(MyStruct(1,3,0.3));
  //
  addMystructToSet( MyStruct(2,1,0.3) , mySet ) ;
  addMystructToSet( MyStruct(3,1,0.5) , mySet ) ;

  cout << "Number of elements in mySet : " << mySet.size() << endl;

  //Print
  for(std::unordered_set<MyStruct,MyStructHasher>::iterator it = mySet.begin() ; it != mySet.end() ; it++) {
    cout << it->pairInt.first << " "<< it->pairInt.second << " "<< it->coeff << endl ;
  }

  //Find based on std::pair (no matter the order) : 
  std::unordered_set<MyStruct,MyStructHasher>::iterator it = mySet.find(MyStruct(3,1)) ;
  if( it != mySet.end()) cout << "Found " << (*it).coeff << endl ;


  it = mySet.find(MyStruct(1,1)) ;
  if( it != mySet.end()) cout << "Found " << (*it).coeff << endl ;
}
