all:

check: vagrant_validate ansible_check

vagrant_validate:
	vagrant validate

ansible_check:
	$(MAKE) -C ansible

provision:
	vagrant up --provision
