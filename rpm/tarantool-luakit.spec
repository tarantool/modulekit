%define modname luakit
Name: tarantool-%{modname}
Version: 2.0.0
Release: 1%{?dist}
Summary: Lua module template for Tarantool
Group: Applications/Databases
License: BSD
URL: https://github.com/tarantool/%{modname}
Source0: https://github.com/tarantool/%{modname}/archive/%{version}/%{modname}-%{version}.tar.gz
BuildArch: noarch
BuildRequires: tarantool-devel >= 1.6.8.0
Requires: tarantool >= 1.6.8.0

%description
This package provides a Lua module template for Tarantool.

%prep
%setup -q -n %{modname}-%{version}

%check
./test/luakit.test.lua

%install
# Create /usr/share/tarantool/%{modname}
mkdir -p %{buildroot}%{_datadir}/tarantool/%{modname}
# Copy init.lua to /usr/share/tarantool/%{modname}/init.lua
cp -p %{modname}/*.lua %{buildroot}%{_datadir}/tarantool/%{modname}

%files
%dir %{_datadir}/tarantool/%{modname}
%{_datadir}/tarantool/%{modname}/
%doc README.md
%{!?_licensedir:%global license %doc}
%license LICENSE AUTHORS

%changelog
* Tue Feb 21 2017 Roman Tsisyk <roman@taratoool.org> 2.0.0-1
- Split package into luakit and ckit.

* Wed Feb 17 2016 Roman Tsisyk <roman@tarantool.org> 1.0.1-1
- Fix to comply Fedora Package Guidelines

* Wed Sep 16 2015 Roman Tsisyk <roman@tarantool.org> 1.0.0-1
- Initial version of the RPM spec
