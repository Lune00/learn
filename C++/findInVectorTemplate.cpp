#include<iostream>
#include<fstream>
#include<math.h>
#include<algorithm>
#include<vector>


//On cree une fonction find a l'aide d'un template qui peut chercher dans n'importe quel vecteur de type T.
//Il suffit de surcharger l'operateur == utilisé par find
//Montre sur un exemple

using namespace std;

struct Bar {
  int a_ ;
  Bar(int a ) : a_(a) { } 
  bool operator==(const Bar& b ) const {
    if (a_ == b.a_ ) return true ;
    else return false ;
  }
};


//Renvoie une pair qui contient vrai ou faux si trouvé (first), et la position(seconde)
template < typename T >
std::pair<bool, int> findInVector(const std::vector<T> & vec , const T& element ) {
  std::pair<bool,int> result ;
  auto it = std::find(vec.begin() , vec.end() , element ) ;
  if (it != vec.end() ) {
    result.second = distance(vec.begin() , it ) ;
    result.first = true ;
  }
  else {
    result.second = -1 ;
    result.first = false ;
  }
  return result ;
}

int main(){

  std::vector<Bar> vec ;

  for(int i = 0 ; i < 10 ; i++ ) {
    vec.push_back( Bar(i) ) ;
  }

  //Exemple : 
  std::pair<bool,int> found = findInVector<Bar>(vec,5) ;
  if(found.first) cout << "Found at position " << found.second << endl ;
  found = findInVector<Bar>(vec, 11 ) ;
  if(found.first) cout << "Found ! " << endl ;
  else cout << "Not found ! "<< endl ;

  return 0 ;
}
