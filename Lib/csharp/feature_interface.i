%define DECLARE_INTERFACE_(CTYPE, INTERFACE, IMPL, OWN_FLAG)
%feature("interface", name = "INTERFACE", cptr = "GetCPtr") CTYPE;
%typemap(cstype) CTYPE*, CTYPE& "INTERFACE"
%typemap(csdirectorout) CTYPE*, CTYPE& "$cscall.GetCPtr().Handle"
%typemap(csdirectorin) CTYPE*, CTYPE&
%{
	(INTERFACE)new IMPL($iminput,false)
%}
%typemap(csin) CTYPE*, CTYPE& "$csinput.GetCPtr()"
%typemap(csout, excode=SWIGEXCODE) CTYPE*, CTYPE&
{
     IMPL ret = new IMPL($imcall,OWN_FLAG); 
     $excode
     return (INTERFACE)ret;
}
%enddef

%define DECLARE_INTERFACE_RENAME_EXPL(CTYPE, INTERFACE, IMPL, OWN_FLAG)
%rename (IMPL) CTYPE;
DECLARE_INTERFACE_(CTYPE, INTERFACE, IMPL, OWN_FLAG)
%enddef

%define DECLARE_INTERFACE_RENAME(CTYPE, INTERFACE, IMPL)
%rename (IMPL) CTYPE;
DECLARE_INTERFACE_(CTYPE, INTERFACE, IMPL, true)
%enddef

%define DECLARE_INTERFACE(CTYPE, INTERFACE, OWN_FLAG)
DECLARE_INTERFACE_(CTYPE, INTERFACE, CTYPE, OWN_FLAG)
%enddef

%define DECLARE_ABSTRACT(CTYPE, IMPL)
%feature("abstract", impname = "IMPL") CTYPE;
%typemap(csclassmodifiers) CTYPE "public abstract class"
%typemap(csdirectorin) CTYPE*, const CTYPE&
%{
	new IMPL($iminput,false)
%}
%typemap(csout, excode=SWIGEXCODE) CTYPE*, const CTYPE&
{ 
     IMPL ret = new IMPL($imcall,true); 
     $excode
     return ret;
}
%enddef

%define DECLARE_ABSTRACT_NS(CTYPE, IMPL, NAMESPACE)
%feature("abstract", impname = "IMPL") CTYPE;
%typemap(csclassmodifiers) CTYPE "public abstract class"
%typemap(csdirectorin) CTYPE*, const CTYPE&
%{
	new NAMESPACE.IMPL($iminput,false)
%}
%typemap(csout, excode=SWIGEXCODE) CTYPE*, const CTYPE&
{ 
     NAMESPACE.IMPL ret = new NAMESPACE.IMPL($imcall,true); 
     $excode
     return ret;
}
%enddef
