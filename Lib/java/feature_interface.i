%define DECLARE_INTERFACE_(CTYPE, INTERFACE, IMPL)
%feature("interface", name = "INTERFACE", cptr = #INTERFACE ## "_getCPtr") CTYPE;
%typemap(jstype) CTYPE*, CTYPE& "INTERFACE"
%typemap(jtype, nopgcpp="1") CTYPE*, CTYPE& "long"
%typemap(javadirectorout) CTYPE*, CTYPE& "$javacall." ## #INTERFACE ## "_getCPtr()"
%typemap(javadirectorin) CTYPE*, CTYPE&
%{
	($jniinput == 0) ? null : (INTERFACE)new IMPL($jniinput,false)
%}
%typemap(javain) CTYPE*, CTYPE& "$javainput." ## #INTERFACE ## "_getCPtr()"
%typemap(javaout) CTYPE*, CTYPE&
{ 
  long cPtr = $jnicall;
  return (cPtr == 0) ? null : (INTERFACE)new IMPL(cPtr,true); 
}
%typemap(directorin,descriptor="L$packagepath/" ## #INTERFACE ## ";") CTYPE*, CTYPE&
%{ $input = 0;
   *(($&1_ltype*)&$input) = &$1; 
%}
SWIG_JAVABODY_PROXY(public, protected, CTYPE)
%enddef

%define DECLARE_INTERFACE_RENAME(CTYPE, INTERFACE, IMPL)
%rename (IMPL) CTYPE;
DECLARE_INTERFACE_(CTYPE, INTERFACE, IMPL)
%enddef

%define DECLARE_INTERFACE(CTYPE, INTERFACE)
DECLARE_INTERFACE_(CTYPE, INTERFACE, CTYPE)
%enddef

%define DECLARE_ABSTRACT(CTYPE, IMPL)
%feature("abstract", impname = "IMPL") CTYPE;
%typemap(javaclassmodifiers) CTYPE "public abstract class"
%typemap(javadirectorin) CTYPE*, const CTYPE&
%{
	($jniinput == 0) ? null : new IMPL($jniinput,false)
%}
%typemap(javaout) CTYPE*, const CTYPE&
{ 
  long cPtr = $jnicall;
  return (cPtr == 0) ? null : new IMPL(cPtr,true); 
}
%enddef

%define DECLARE_ABSTRACT_NS(CTYPE, IMPL, NAMESPACE)
%feature("abstract", impname = "IMPL") CTYPE;
%typemap(javaclassmodifiers) CTYPE "public abstract class"
%typemap(javadirectorin) CTYPE*, const CTYPE&
%{
	($jniinput == 0) ? null : new NAMESPACE.IMPL($jniinput,false)
%}
%typemap(javaout) CTYPE*, const CTYPE&
{ 
  long cPtr = $jnicall;
  return (cPtr == 0) ? null : new NAMESPACE.IMPL(cPtr,true); 
}
%enddef
