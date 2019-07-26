#include<iostream>
#include<fstream>
#include<math.h>
#include<string>

using namespace std;
 

struct Rule {

  int a_ ;
  int b_ ;
  bool isOk_ ;

  Rule(int a = 1, int b = 20, bool isOk = false ) : a_(a) , b_(b), isOk_(isOk)
  { }


};





int main(){
 

  Rule rule;
  cout << rule.a_ << " "<< rule.b_ << " " << rule.isOk_ << endl ;
  std::string number = "0000300" ;
  int n = std::stoi(number) ;
  cout <<  n << endl ;

  
  



}
