

fun <- function( i ){

	index <- (1:i)-1
	collapse <- function(x, collapse = ", " ) paste( x, collapse = collapse )
	
	typenames <- collapse( sprintf( "typename U%d", index ) )
	u <- collapse( sprintf( "U%d u%d", index, index ) )
    input_parameter <- collapse( sprintf( "typename Rcpp::traits::input_parameter< U%d >::type x%d( args[%d] ) ;", index, index, index ), collapse = "\n" )  
    x <- collapse( sprintf( "x%d", index ) )
    U <- collapse( sprintf( "U%d", index ) )
       
txt <- sprintf( '

	template < typename Class, typename OUT, %s > class Pointer_CppMethod%d : public CppMethod<Class> {
	public:
		typedef OUT (*Method)(Class*, %s) ;
		typedef CppMethod<Class> method_class ;
		typedef typename Rcpp::traits::remove_const_and_reference< OUT >::type CLEANED_OUT ;
		
		Pointer_CppMethod%d(Method m) : method_class(), met(m){} 
		SEXP operator()( Class* object, SEXP* args){
		    %s
		    return Rcpp::module_wrap<CLEANED_OUT>( met( object, %s ) ) ;
		}
		inline int nargs(){ return %d ; }
		inline bool is_void(){ return false ; }
		inline bool is_const(){ return false ; }
		inline void signature(std::string& s, const char* name){ Rcpp::signature<OUT,%s>(s, name) ; }
		
	private:
		Method met ;
	} ;
	
	template < typename Class, %s > class Pointer_CppMethod%d<Class,void,%s> : public CppMethod<Class> {
	public:
		typedef void (*Method)(Class*, %s) ;
		typedef CppMethod<Class> method_class ;
		
		Pointer_CppMethod%d( Method m) : method_class(), met(m){} 
		SEXP operator()( Class* object, SEXP* args){
			%s
		    met( object, %s ) ;
			return R_NilValue ;
		}
		inline int nargs(){ return %d ; }
		inline bool is_void(){ return true ; }
		inline bool is_const(){ return false ; }
		inline void signature(std::string& s, const char* name){ Rcpp::signature<void_type,%s>(s, name) ; }
		
	private:
		Method met ;
	} ;

	
	// const
	
	template < typename Class, typename OUT, %s > class Const_Pointer_CppMethod%d : public CppMethod<Class> {
	public:
		typedef OUT (*Method)(const Class*, %s) ;
		typedef CppMethod<Class> method_class ;
		typedef typename Rcpp::traits::remove_const_and_reference< OUT >::type CLEANED_OUT ;
		
		Const_Pointer_CppMethod%d(Method m) : method_class(), met(m){} 
		SEXP operator()( Class* object, SEXP* args){
			%s
			return Rcpp::module_wrap<CLEANED_OUT>( met( object, %s ) ) ;
		}
		inline int nargs(){ return %d ; }
		inline bool is_void(){ return false ; }
		inline bool is_const(){ return true ; }
		inline void signature(std::string& s, const char* name){ Rcpp::signature<OUT,%s>(s, name) ; }
		
	private:
		Method met ;
	} ;
	
	template < typename Class, %s > class Const_Pointer_CppMethod%d<Class,void,%s> : public CppMethod<Class> {
	public:
		typedef void (*Method)(const Class*, %s) ;
		typedef CppMethod<Class> method_class ;
		
		Const_Pointer_CppMethod%d( Method m) : method_class(), met(m){} 
		SEXP operator()( Class* object, SEXP* args){
			%s
			met( object, %s ) ;
			return R_NilValue ;
		}
		inline int nargs(){ return %d ; }
		inline bool is_void(){ return true ; }
		inline bool is_const(){ return true ; }
		inline void signature(std::string& s, const char* name){ Rcpp::signature<void_type,%s>(s, name) ; }
		
	private:
		Method met ;
	} ;


', 
typenames,  # typename U0, ...
i,           
u,          # U0 u0, ...
i, 
input_parameter,
x,
i,
U, 

typenames,  # typename U0, ...
i, 
U, 			# U0, ...
u,          # U0 u0, ...
i, 
input_parameter,
x,
i,
U, 


# const 
typenames,  # typename U0, ...
i,           
u,          # U0 u0, ...
i, 
input_parameter,
x,
i,
U, 

typenames,  # typename U0, ...
i, 
U, 			# U0, ...
u,          # U0 u0, ...
i, 
input_parameter,
x,
i,
U


)   

}

file <- sprintf( 
'// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; tab-width: 8 -*-
//
// Module_generated_CppMethod.h: Rcpp R/C++ interface class library -- Rcpp modules
//
// Copyright (C) 2010-2012  Doug Bates, Dirk Eddelbuettel and Romain Francois
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

#ifndef Rcpp_Module_generated_Pointer_CppMethod_h
#define Rcpp_Module_generated_Pointer_CppMethod_h


	template <typename Class, typename OUT> class Pointer_CppMethod0 : public CppMethod<Class> {
	public:
		typedef OUT (*Method)(Class*) ;
		typedef CppMethod<Class> method_class ;
		Pointer_CppMethod0( Method m) : method_class(), met(m){} 
		SEXP operator()( Class* object, SEXP* ){
			return Rcpp::module_wrap<OUT>( met(object) ) ;
		}
		inline int nargs(){ return 0 ; }
		inline bool is_void(){ return false ; }
		inline bool is_const(){ return false ; }
		inline void signature(std::string& s, const char* name){ Rcpp::signature<OUT>(s, name) ; }
		
	private:
		Method met ;
	} ;
	
	template <typename Class> class Pointer_CppMethod0<Class,void> : public CppMethod<Class> {
	public:
		typedef void (*Method)(Class*) ;
		typedef CppMethod<Class> method_class ;
		Pointer_CppMethod0( Method m) : method_class(), met(m){} 
		SEXP operator()( Class* object, SEXP* ){
			met( object ) ;
			return R_NilValue ;
		}
		inline int nargs(){ return 0 ; }
		inline bool is_void(){ return true ; }
		inline bool is_const(){ return false ; }
    
		inline void signature(std::string& s, const char* name){ Rcpp::signature<void_type>(s, name) ; }
		
	private:
		Method met ;
	} ;
	
	
	
	
	template <typename Class, typename OUT> class Const_Pointer_CppMethod0 : public CppMethod<Class> {
	public:
		typedef OUT (*Method)(const Class*) ;
		typedef CppMethod<Class> method_class ;
		Const_Pointer_CppMethod0( Method m) : method_class(), met(m){} 
		SEXP operator()( Class* object, SEXP* ){
			return Rcpp::module_wrap<OUT>( met(object) ) ;
		}
		inline int nargs(){ return 0 ; }
		inline bool is_void(){ return false ; }
		inline bool is_const(){ return true ; }
		inline void signature(std::string& s, const char* name){ Rcpp::signature<OUT>(s, name) ; }
		
	private:
		Method met ;
	} ;
	
	template <typename Class> class Const_Pointer_CppMethod0<Class,void> : public CppMethod<Class> {
	public:
		typedef void (*Method)(const Class*) ;
		typedef CppMethod<Class> method_class ;
		Const_Pointer_CppMethod0( Method m) : method_class(), met(m){} 
		SEXP operator()( Class* object, SEXP* ){
			met( object ) ;
			return R_NilValue ;
		}
		inline int nargs(){ return 0 ; }
		inline bool is_void(){ return true ; }
		inline bool is_const(){ return true ; }
    
		inline void signature(std::string& s, const char* name){ Rcpp::signature<void_type>(s, name) ; }
		
	private:
		Method met ;
	} ;
	
	
%s

#endif
', paste( sapply( 1:65 , fun), collapse = "\n" ) 
)

writeLines( file, "../pkg/Rcpp/inst/include/Rcpp/module/Module_generated_Pointer_CppMethod.h" )





