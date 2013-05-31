%define DECLARE_INTERFACE_(CTYPE, INTERFACE, IMPL)
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
     IMPL ret = new IMPL($imcall,true); 
     $excode
     return (INTERFACE)ret;
}
%enddef

%define DECLARE_INTERFACE_RENAME(CTYPE, INTERFACE, IMPL)
%rename (IMPL) CTYPE;
DECLARE_INTERFACE_(CTYPE, INTERFACE, IMPL)
%enddef

%define DECLARE_INTERFACE(CTYPE, INTERFACE)
DECLARE_INTERFACE_(CTYPE, INTERFACE, CTYPE)
%enddef

