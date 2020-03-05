all: check

check: yamllint syntax

yamllint:
	yamllint -c .yamllint ./

syntax:
	ansible-playbook --syntax-check *.yml -i localhost,
