#include<iostream>
#include<fstream>
#include<math.h>
#include<vector>
#include<cstdlib>

using namespace std;




void writePdf(const std::vector<double>& values) {


  const unsigned int nBins = 50 ; 
  double min = 0. ;
  double max = 9. ;
  double dx = (max - min) / nBins ; 
  std::vector<double> hist( nBins + 1 ) ;

  for(unsigned int i = 0 ; i < values.size() ; i++ ) {
    int p = floor( values[i] / dx ) ;
    hist[ p ] ++ ;
  }

  //Normalise
  for(unsigned int i = 0 ; i < hist.size() ; i++ ) {
    hist[ i ] /= (double)values.size();
  }

  ofstream output ;
  output.open("pdf.txt") ;

  double sum = 0 ;
  for(unsigned int i = 0 ; i < hist.size() ; i++ ) {
    output << ( i - 0.5 ) * dx <<" "<< hist[i] << endl ;
    sum += hist[i] ;
  }

  cout << "Normalisation : " << sum << endl ;
  output.close() ;
}





int main(){


  ofstream myfile ;
  myfile.open("data.txt");

  int nalleles = 10 ;
  int nGenes = 3 ;

  int nSamples = 500000 ;
  std::vector<double> data ;

  for (int sample = 0 ; sample < nSamples  ; sample++ ) {

    // Generate sample data : Global exploration
    //for( int i = 0 ; i < 10 ; i++) {
    //  for( int j = i  ; j < 10 ; j++) {
    //    double coeff = (random() / (double)RAND_MAX) ;
    //    //double coeff = 0.5 ;
    //    double v = coeff * i + ( 1 - coeff) * j ;
    //    data.push_back( v ) ;
    //  }
    //}

    // Generate sample with random combinaisons of alleles : choose n( =ngenes) random pairs among N(nAlleles)
    // with n genes expressions for each final value of the feature v
    double v = 0. ;
    for( int n = 0 ; n < nGenes ; n++) {
      unsigned int a = rand() % nalleles ;
      unsigned int b = rand() % nalleles ;
     // double coeff = (random() / (double)RAND_MAX) ;
      double coeff = 0.3 ;
      v += coeff * a + ( 1 - coeff) * b ;
    }

    v /= (double)nGenes ;
    data.push_back( v ) ;
  }

  //Statistics : mean , std , pdf , min , max
  writePdf(data) ;

  myfile.close();

  return 0 ;

}
