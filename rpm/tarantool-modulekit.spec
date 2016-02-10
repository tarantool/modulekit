Name: tarantool-modulekit
Version: 1.0.0
Release: 1%{?dist}
Summary: A set of Tarantool module templates
Group: Development/Languages
License: BSD
URL: https://github.com/tarantool/modulekit
Source0: %{name}-%{version}.tar.gz
BuildRequires: cmake
BuildRequires: tarantool >= 1.6.8.0
Vendor: tarantool.org
%description
A set of Lua, Lua/C and C module templates for Tarantool.

##################################################################

%prep
%setup -q -n %{name}-%{version}

%build
%cmake . -DCMAKE_BUILD_TYPE=RelWithDebugInfo
make %{?_smp_mflags}

%install
make DESTDIR=%{buildroot} install

%files
"%{_libdir}/tarantool/*/"
"%{_datarootdir}/tarantool/*/"

%changelog
* Wed Sep 16 2015 Roman Tsisyk <roman@tarantool.org> 1.0.0-1
- Initial version of the RPM spec
