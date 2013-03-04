# installs kpkg
# everything here is phony.
.PHONY: default install setup-dirs copy-files

default:
	@echo "please run \"make install\" to install kpkg"

install: setup-dirs copy-files setup-bashrc

# make required directories
setup-dirs:
	test -d "$(HOME)/bin" || mkdir "$(HOME)/bin"
	test -d "$(HOME)/lib" || mkdir "$(HOME)/lib"
	test -d "$(HOME)/include" || mkdir "$(HOME)/include"
	test -d "$(HOME)/.kpkg" || mkdir "$(HOME)/.kpkg"
	test -d "$(HOME)/.kpkg/scripts" || mkdir "$(HOME)/.kpkg/scripts"
	test -d "$(HOME)/.kpkg/packages" || mkdir "$(HOME)/.kpkg/packages"

# copy files over
copy-files:
	cp -r packages "$(HOME)/.kpkg/"
	cp -r scripts/*.sh "$(HOME)/.kpkg/scripts"
	cp kpkg.sh "$(HOME)/bin/kpkg"
	chmod +x "$(HOME)/bin/kpkg"

# setup bashrc (if needed)
setup-bashrc:
	@bash setup-bashrc.sh
