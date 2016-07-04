
fun <- function( i ){
	
    typename <- if( i == 0 ) "" else paste( ",", paste( sprintf( "typename U%d", (1:i)-1 ), collapse = ", " ) , sep = "" )
    Uu <- if( i == 0 ) "void" else paste( sprintf( "U%d u%d", (1:i)-1, (1:i)-1 ), collapse = ", " )
    U <- if( i == 0 ) "" else paste( ",", paste( sprintf( "U%d", (1:i)-1 ), collapse = ", " ) , sep = "" )
    
txt <- sprintf( '
template <typename OUT%s>                                                                   
void function( const char* name_,  OUT (*fun)(%s), const char* docstring = 0){
  Rcpp::Module* scope = ::getCurrentScope() ;
  if( scope ){
    scope->Add( name_, new CppFunction%d<OUT%s>( fun, docstring ) ) ;
  }
}

template <typename OUT%s>                                                                   
void function( const char* name_,  OUT (*fun)(%s), Rcpp::List formals, const char* docstring = 0){
  Rcpp::Module* scope = ::getCurrentScope() ;
  if( scope ){
    scope->Add( name_, new CppFunction_WithFormals%d<OUT%s>( fun, formals, docstring ) ) ;
  }
}
', 
typename, 
Uu, 
i, 
U, 

typename, 
Uu, 
i, 
U
)
	
}

file <- sprintf( 
'// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; tab-width: 8 -*-
//
// Module_generated_function.h: Rcpp R/C++ interface class library -- Rcpp modules
//
// Copyright (C) 2010	Dirk Eddelbuettel and Romain Francois
//
// This file is part of Rcpp.
//
// Rcpp is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 2 of the License, or
// (at your option) any later version.
//
// Rcpp is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Rcpp.  If not, see <http://www.gnu.org/licenses/>.

#ifndef Rcpp_Module_generated_function_h
#define Rcpp_Module_generated_function_h

%s

#endif
', paste( sapply( 0:65, fun), collapse = "\n" ) 
)

writeLines( file, "Rcpp/inst/include/Rcpp/module/Module_generated_function.h" )



