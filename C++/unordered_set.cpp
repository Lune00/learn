#include<iostream>
#include<unordered_set>
#include <boost/functional/hash.hpp>

//We try to build a unordered set based on pair<int,int> for the hash function

using namespace std;
 
struct MyStruct{
  std::pair < int , int > pairInt ;
  
  MyStruct() : pairInt(0,0) {}
  MyStruct(int a , int b ) : pairInt( a, b ) {}
  std::pair<int,int> getPairInt() const { return pairInt ; }

  //Ici je peux definir == comme pair(a,b) = pair(b,a) et en stocker qu'une
  //Je fais d'abord un rangement croissant
  //Apres a chaque calcul, je les range par ordre croissant et j'appelle la pair qui m'interesse
bool operator==(const MyStruct& other) const {
  cout << "operator == called " << endl ;
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
    return boost::hash<std::pair <int, int > >()(obj.getPairInt()) ;
  }
};

int main(){
 
cout << "unordered set" << endl;

MyStruct mystruct(1 , 3) ;
cout << mystruct.pairInt.first <<" "<< mystruct.pairInt.second << endl ;

std::unordered_set< MyStruct, MyStructHasher > mySet ; 

//Insert : 
mySet.insert(mystruct) ;
mySet.insert(MyStruct(1,2));
mySet.insert(MyStruct(1,2));

cout << mySet.size() << endl;

//Find : 
if( mySet.find(MyStruct(1,2)) != mySet.end()) cout << "Found" << endl ;




}
