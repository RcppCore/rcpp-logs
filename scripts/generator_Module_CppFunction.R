
fun <- function( i ){

    index <- (1:i)-1
    collapse <- function(x, sep = "," ) paste( x, collapse = sep )

txt <- sprintf( '
template <typename OUT, %s> class CppFunction%d : public CppFunction {
    public:

        CppFunction%d(OUT (*fun)(%s) , const char* docstring = 0) : CppFunction(docstring), ptr_fun(fun){}

        SEXP operator()(SEXP* args) {
            BEGIN_RCPP
            
            %s
            
            return Rcpp::module_wrap<OUT>( ptr_fun( %s ) ) ;
            END_RCPP
        }

        inline int nargs(){ return %d; }
        inline void signature(std::string& s, const char* name){ Rcpp::signature<OUT,%s>(s, name) ; }
        inline DL_FUNC get_function_ptr(){ return (DL_FUNC)ptr_fun ; }
        
    private:
        OUT (*ptr_fun)(%s) ;
} ;

template <%s>
class CppFunction%d<void,%s> : public CppFunction {
    public:
        CppFunction%d(void (*fun)(%s) , const char* docstring = 0) : CppFunction(docstring), ptr_fun(fun){}

        SEXP operator()(SEXP* args) {
            BEGIN_RCPP
            
            %s
            ptr_fun( %s ) ;
            END_RCPP
        }

        inline int nargs(){ return %d; }
        inline bool is_void(){ return true; }
        inline void signature(std::string& s, const char* name){ Rcpp::signature<void_type,%s>(s, name) ; }
        inline DL_FUNC get_function_ptr(){ return (DL_FUNC)ptr_fun ; }
        
    private:
        void (*ptr_fun)(%s) ;
} ;



template <typename OUT, %s>
class CppFunction_WithFormals%d : public CppFunction {
    public:

        CppFunction_WithFormals%d(OUT (*fun)(%s) , Rcpp::List formals_, const char* docstring = 0) :
            CppFunction(docstring), formals(formals_), ptr_fun(fun){}

        SEXP operator()(SEXP* args) {
            BEGIN_RCPP
            %s
            return Rcpp::module_wrap<OUT>( ptr_fun( %s ) ) ;
            END_RCPP
        }

        inline int nargs(){ return %d; }
        inline void signature(std::string& s, const char* name){ Rcpp::signature<OUT,%s>(s, name) ; }
        SEXP get_formals(){ return formals; }
        inline DL_FUNC get_function_ptr(){ return (DL_FUNC)ptr_fun ; }
        
    private:
        Rcpp::List formals ;
        OUT (*ptr_fun)(%s) ;
} ;

template <%s>
class CppFunction_WithFormals%d<void,%s> : public CppFunction {
    public:
        CppFunction_WithFormals%d(void (*fun)(%s), Rcpp::List formals_, const char* docstring = 0) :
            CppFunction(docstring), formals(formals_), ptr_fun(fun){}

        SEXP operator()(SEXP* args) {
            BEGIN_RCPP
            %s
            ptr_fun( %s ) ;
            END_RCPP
        }

        inline int nargs(){ return %d; }
        inline bool is_void(){ return true; }
        inline void signature(std::string& s, const char* name){ Rcpp::signature<void_type,%s>(s, name) ; }
        SEXP get_formals(){ return formals; }
        inline DL_FUNC get_function_ptr(){ return (DL_FUNC)ptr_fun ; }
        
    private:
        Rcpp::List formals ;
        void (*ptr_fun)(%s) ;
} ;

',
collapse( sprintf( "typename U%d", index ) ),
i,
i,
collapse( sprintf( "U%d", index ) ),
collapse( sprintf( "typename traits::input_parameter< U%d >::type x%d( args[%d] ) ;", index, index, index ), sep = "\n            " ),
collapse( sprintf( "x%d", index ) ),
i,
collapse( sprintf( "U%d", index ) ),
collapse( sprintf( "U%d", index ) ),


paste( sprintf( "typename U%d", index ), collapse = ", " ),
i,
collapse( sprintf( "U%d", index ) ),
i,
collapse( sprintf( "U%d", index ) ),
collapse( sprintf( "typename traits::input_parameter< U%d >::type x%d( args[%d] ) ;", index, index, index ), sep = "\n            " ),
collapse( sprintf( "x%d", index ) ),
i,
collapse( sprintf( "U%d", index ) ),
collapse( sprintf( "U%d", index ) ),

# _ WithFormals
collapse( sprintf( "typename U%d", index ) ),
i,
i,
collapse( sprintf( "U%d", index ) ),
collapse( sprintf( "typename traits::input_parameter< U%d >::type x%d( args[%d] ) ;", index, index, index ), sep = "\n            " ),
collapse( sprintf( "x%d", index ) ),
i,
collapse( sprintf( "U%d", index ) ),
collapse( sprintf( "U%d", index ) ),


paste( sprintf( "typename U%d", index ), collapse = ", " ),
i,
collapse( sprintf( "U%d", index ) ),
i,
collapse( sprintf( "U%d", index ) ),
collapse( sprintf( "typename traits::input_parameter< U%d >::type x%d( args[%d] ) ;", index, index, index ), sep = "\n            " ),
collapse( sprintf( "x%d", index ) ),
i,
collapse( sprintf( "U%d", index ) ),
collapse( sprintf( "U%d", index ) )
)

}

file <- sprintf(
'// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; tab-width: 8 -*-
//
// Module_generated_CppFunction.h: Rcpp R/C++ interface class library -- Rcpp modules
//
// Copyright (C) 2010-2013  Dirk Eddelbuettel and Romain Francois
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

#ifndef Rcpp_Module_generated_CppFunction_h
#define Rcpp_Module_generated_CppFunction_h

template <typename OUT>
class CppFunction0 : public CppFunction {
    public:
        CppFunction0(OUT (*fun)(void), const char* docstring = 0 ) : CppFunction(docstring), ptr_fun(fun){}
        SEXP operator()(SEXP*) {
            BEGIN_RCPP
            return Rcpp::module_wrap<OUT>( ptr_fun() ) ;
            END_RCPP
        }

        inline int nargs(){ return 0; }
        inline void signature(std::string& s, const char* name){ Rcpp::signature<OUT>(s, name) ; }
        inline DL_FUNC get_function_ptr(){ return (DL_FUNC)ptr_fun ; }
        
    private:
        OUT (*ptr_fun)(void) ;
} ;


template <>
class CppFunction0<void> : public CppFunction {
    public:
        CppFunction0(void (*fun)(void), const char* docstring = 0 ) : CppFunction(docstring), ptr_fun(fun){} ;

        SEXP operator()(SEXP*) {
            BEGIN_RCPP
            ptr_fun() ;
            END_RCPP
        }

        inline int nargs(){ return 0; }
        inline bool is_void(){ return true; }
        inline void signature(std::string& s, const char* name){ Rcpp::signature<void_type>(s, name) ; }
        inline DL_FUNC get_function_ptr(){ return (DL_FUNC)ptr_fun ; }
        
    private:
        void (*ptr_fun)(void) ;
} ;


template <typename OUT>
class CppFunction_WithFormals0 : public CppFunction {
    public:
        CppFunction_WithFormals0(OUT (*fun)(void), Rcpp::List,  const char* docstring = 0 ) : CppFunction(docstring), ptr_fun(fun){}
        SEXP operator()(SEXP*) {
            BEGIN_RCPP
            return Rcpp::module_wrap<OUT>( ptr_fun() ) ;
            END_RCPP
        }

        inline int nargs(){ return 0; }
        inline void signature(std::string& s, const char* name){ Rcpp::signature<OUT>(s, name) ; }
        inline DL_FUNC get_function_ptr(){ return (DL_FUNC)ptr_fun ; }
        
    private:
        OUT (*ptr_fun)(void) ;
} ;


template <>
class CppFunction_WithFormals0<void> : public CppFunction {
    public:
        CppFunction_WithFormals0(void (*fun)(void), Rcpp::List, const char* docstring = 0 ) : CppFunction(docstring), ptr_fun(fun){} ;

        SEXP operator()(SEXP*) {
            BEGIN_RCPP
            ptr_fun() ;
            END_RCPP
        }

        inline int nargs(){ return 0; }
        inline bool is_void(){ return true; }
        inline void signature(std::string& s, const char* name){ Rcpp::signature<void_type>(s, name) ; }
        inline DL_FUNC get_function_ptr(){ return (DL_FUNC)ptr_fun ; }
        
    private:
        void (*ptr_fun)(void) ;
} ;

%s

#endif
', paste( sapply( 1:65, fun), collapse = "\n" )
)

writeLines( file, "Rcpp/inst/include/Rcpp/module/Module_generated_CppFunction.h" )



