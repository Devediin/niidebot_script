prepare:
	bash provision/00_prepare.sh

install:
	bash install.sh

validate:
	bash provision/07_validate_install.sh

full:
	bash provision/00_prepare.sh && bash provision/99_full_install.sh
