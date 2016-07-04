
fun <- function( i ){
	
txt <- sprintf( '

	template <typename OUT%s>
	InternalFunction( OUT (*fun)(%s) ) : RObject() {
		set( XPtr< CppFunction%d<OUT%s> >( new CppFunction%d<OUT%s>( fun ), false ) ) ;
	}

', 
if( i == 0 ) "" else paste( ",", paste( sprintf( "typename U%d", (1:i)-1 ), collapse = ", " ) , sep = "" ), 
if( i == 0 ) "void" else paste( sprintf( "U%d u%d", (1:i)-1, (1:i)-1 ), collapse = ", " ), 
i, 
if( i == 0 ) "" else paste( ",", paste( sprintf( "U%d", (1:i)-1 ), collapse = ", " ) , sep = "" ), 
i, 
if( i == 0 ) "" else paste( ",", paste( sprintf( "U%d", (1:i)-1 ), collapse = ", " ) , sep = "" )
)
	
}

file <- sprintf( 
'// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; tab-width: 8 -*-
//           
// InternalFunction__ctors.h: Rcpp R/C++ interface class library -- generated helper code for InternalFunction.h
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

#ifndef Rcpp__generated__InternalFunction_ctors_h
#define Rcpp__generated__InternalFunction_ctors_h

%s

#endif
', paste( sapply( 0:65, fun), collapse = "\n" ) 
)

writeLines( file, "Rcpp/inst/include/Rcpp/generated/InternalFunction__ctors.h" )



