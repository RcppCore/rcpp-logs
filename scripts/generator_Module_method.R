

fun <- function( i ){

	index <- (1:i)-1
	collapse <- function(x) paste( x, collapse = ", " )
	
	typenames <- collapse( sprintf( "typename U%d", index ) )
	u <- collapse( sprintf( "U%d u%d", index, index ) )
    as <- collapse( sprintf( "Rcpp::as< typename Rcpp::traits::remove_const_and_reference< U%d >::type >( args[%d] )", index, index ) )  
    U <- collapse( sprintf( "U%d", index ) )
    
txt <- sprintf( '

	template <typename OUT, %s>
	self& method( const char* name_, OUT (Class::*fun)(%s), const char* docstring = 0, ValidMethod valid = &yes_arity<%d> ){
		AddMethod( name_, new CppMethod%d<Class,OUT,%s>( fun ), valid, docstring) ;
  		return *this ;
	}
	
	template <typename OUT, %s>
	self& method( const char* name_, OUT (Class::*fun)(%s) const, const char* docstring = 0, ValidMethod valid = &yes_arity<%d> ){
		AddMethod( name_, new const_CppMethod%d<Class,OUT,%s>( fun ), valid, docstring ) ;
  		return *this ;
	}

	template <typename OUT, %s>
	self& nonconst_method( const char* name_, OUT (Class::*fun)(%s), const char* docstring = 0, ValidMethod valid = &yes_arity<%d> ){
		AddMethod( name_, new CppMethod%d<Class,OUT,%s>( fun ), valid, docstring ) ;
  		return *this ;
	}
	
	template <typename OUT, %s>
	self& const_method( const char* name_, OUT (Class::*fun)(%s) const, const char* docstring = 0, ValidMethod valid = &yes_arity<%d>){
		AddMethod( name_, new const_CppMethod%d<Class,OUT,%s>( fun ), valid, docstring ) ;
  		return *this ;
	}

',
typenames,   # typename U0, ...
u,           # U0 u0, ...
i, 
i,
U,           # U0, ...

typenames,   # typename U0, ...
u,           # U0 u0, ...
i, 
i,
U,            # U0, ...

typenames,   # typename U0, ...
u,           # U0 u0, ...
i,
i,
U,           # U0, ...

typenames,   # typename U0, ...
u,           # U0 u0, ...
i,
i,
U            # U0, ...

)   

}

file <- sprintf( 
'// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; tab-width: 8 -*-
//
// Module_generated_method.h: Rcpp R/C++ interface class library -- Rcpp modules
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

#ifndef Rcpp_Module_generated_method_h
#define Rcpp_Module_generated_method_h

	template <typename OUT>
	self& method( const char* name_, OUT (Class::*fun)(void), const char* docstring = 0, ValidMethod valid = &yes ){
		AddMethod( name_, new CppMethod0<Class,OUT>( fun ), valid, docstring) ;
  		return *this ;
	}
	
	template <typename OUT>
	self& method( const char* name_, OUT (Class::*fun)(void) const, const char* docstring = 0, ValidMethod valid = &yes ){
		AddMethod( name_, new const_CppMethod0<Class,OUT>( fun ), valid, docstring ) ;
  		return *this ;
	}

	
	template <typename OUT>
	self& nonconst_method( const char* name_, OUT (Class::*fun)(void), const char* docstring = 0, ValidMethod valid = &yes ){
		AddMethod( name_, new CppMethod0<Class,OUT>( fun ) , valid, docstring ) ;
  		return *this ;
	}
	template <typename OUT>
	self& const_method( const char* name_, OUT (Class::*fun)(void) const, const char* docstring = 0, ValidMethod valid = &yes ){
		AddMethod( name_, new const_CppMethod0<Class,OUT>( fun ), valid, docstring ) ;
  		return *this ;
	}
	
	
%s

#endif
', paste( sapply( 1:65, fun), collapse = "\n" ) 
)

writeLines( file, "Rcpp/inst/include/Rcpp/module/Module_generated_method.h" )





