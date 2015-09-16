Name: tarantool-modulekit
Version: 1.0.0
Release: 1%{?dist}
Summary: A set of Tarantool module templates
Group: Development/Languages
License: BSD
URL: https://github.com/tarantool/modulekit
Source0: %{name}-%{version}.tar.gz
BuildRequires: cmake
Vendor: tarantool.org
%description
A set of Lua, Lua/C and C module templates for Tarantool.

##################################################################

%prep
%setup -c -q %{name}-%{version}

%build
%cmake . -DCMAKE_INSTALL_LIBDIR='%{_libdir}' -DCMAKE_INSTALL_INCLUDEDIR='%{_includedir}' -DCMAKE_BUILD_TYPE=RelWithDebugInfo
make %{?_smp_mflags}

%install
make DESTDIR=%{buildroot} install

%files
"%{_libdir}/tarantool/*/"
"%{_datarootdir}/tarantool/*/"

%changelog
* Wed Sep 16 2015 Roman Tsisyk <roman@tarantool.org> 1.0.0-1
- Initial version of the RPM spec
