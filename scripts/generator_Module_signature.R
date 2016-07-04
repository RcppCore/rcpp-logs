

fun <- function( i ){

	index <- 0:i
	collapse <- function(x) paste( x, collapse = ", " )
	
	typenames <- collapse( sprintf( "typename U%d", index ) )
	demangles <- paste( 
	    sprintf( '    s += ", " ; s+= get_return_type<U%d>();', 1:i), 
	    collapse = "\n" )
    
txt <- sprintf( '

template <typename OUT,%s>
inline void signature(std::string& s, const char* name){
    s.clear() ;
    s += get_return_type<OUT>() ;
    s += " " ;
    s += name ;
    s += "(" ;
    s += get_return_type<U0>() ;
%s
    s += ")" ; 
}


',
typenames,   # typename U0, ...
demangles
)   
txt
}

file <- sprintf( 
'// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; tab-width: 4 -*-
//
// Module_generated_get_signature.h: Rcpp R/C++ interface class library --
//
// Copyright (C) 2010	Doug Bates, Dirk Eddelbuettel and Romain Francois
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

#ifndef Rcpp_Module_generated_get_signature_h
#define Rcpp_Module_generated_get_signature_h

template <typename OUT>
inline void signature(std::string& s, const char* name){
    s.clear() ;
    s += get_return_type<OUT>() ;
    s += " " ;
    s += name ;
    s += "()" ;
}


template <typename OUT,typename U0>
inline void signature(std::string& s, const char* name){
    s.clear() ;
    s += get_return_type<OUT>() ;
    s += " " ;
    s += name ;
    s += "(" ;
    s += get_return_type<U0>() ;
    s += ")" ; 
}

%s

#endif', paste( sapply( 1:65, fun), collapse = "\n" ) 
)

writeLines( file, "Rcpp/inst/include/Rcpp/module/Module_generated_get_signature.h" )





