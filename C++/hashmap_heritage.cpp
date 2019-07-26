#include<iostream>
#include<fstream>
#include<math.h>
#include<map>

using namespace std;

class Relation{

  public:
    Relation(int a, int b ) {
      alleles = std::make_pair( a , b ) ;
    }

  private:
    std::pair< int , int > alleles ;
};

class RelationC : public Relation {

  Relation(int a , int b , double coeff ) {
      alleles = std::make_pair( a , b ) ;
      coeff_ = coeff ; 
  }

  private:
    double coeff_ ;
};

class RelationD : public Relation {

  private:
    double probability_ ; 

};

int main() {


  cout << " Heritage et hashmap/set " << endl ;

  return 0 ; 
}
