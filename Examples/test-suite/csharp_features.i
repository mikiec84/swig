%module csharp_features
%include "wchar.i"
%csconst(1);

// SWIG gets the method modifiers wrong occasionally, like with private inheritance, %csmethodmodifiers can fix this
%csmethodmodifiers Derived::VirtualMethod() "public virtual"
%csmethodmodifiers MoreDerived::variable "public new"

%inline %{
class Base {
public:
  virtual ~Base() {}
  virtual void VirtualMethod() {}
};
class Derived : private Base {
public:
  virtual ~Derived() {}
  virtual void VirtualMethod() {}
  int variable;
};
class MoreDerived : public Derived {
public:
  int variable;
  // test wide char literals support for C# module
  void methodWithDefault(const wchar_t* s = L"literal"){}
	static const wchar_t* const wideCharLiteral = L"more wide chars with escapes \x1234\2336";
};
%}

