all:

show_config:

check: vagrant_check ansible_check

vagrant_check:
	vagrant validate -p

ansible_check:
	$(MAKE) -C ansible

provision:
	vagrant up --provision
