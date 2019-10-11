# This Makefile makes locally devloping the website easy and convenient. You only need to invoke short 'make' commands to
# perform operations on local versions of website. 
# NOTE : I use extended verion of hugu under name 'hugo-extended'. You might need to change this name in this Makefile according to
# configirations of your local machine.

help :
	@echo -e "\nUse one of the targets below:\n"
	@echo -e "* 'make server' will start a flat local server in a specified port including all drafts"
	@echo -e "* 'make minserver' will start a minified local server in a specified port includeing all drafts"

# This port on your machine will be used to serve a local version of this website. Change it if needed.
PORT = 1313

# This is the command to run extended version of huge. Change it if it is different on your machime
HUGO = hugo

# Starts a local server using 'localserverconfig.yaml' as its configurations. Renders all drafts
server : localserverconfig.yaml
	@$(HUGO) server -D --port $(PORT) --config localserverconfig.yaml

# Starts a local server using 'localserverconfig.yaml' as its configurations. Renders all drafts and minifies html/css/javascript
minserver : localserverconfig.yaml
	@$(HUGO) server --minify -D --port $(PORT) --config localserverconfig.yaml

# Generates 'localserverconfig.yaml' from 'config.yaml' by replacing the remote base URL with 'http://localhost:$(PORT)/'
localserverconfig.yaml : config.yaml
	@sed -e "s%https://shirazlug.ir/%http://localhost:$(PORT)/%" config.yaml > localserverconfig.yaml

clean :
	@rm localserverconfig.yaml

.PHONY: help localserver minlocalserver clean
