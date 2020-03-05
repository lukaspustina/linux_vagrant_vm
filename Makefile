all:

show_config:

check: vagrant_check yamllint ansible_check

vagrant_check:
	vagrant validate -p

yamllint:
	yamllint -c ansible/.yamllint ansible

ansible_check:
	$(MAKE) -C ansible

provision:
	vagrant up --provision
