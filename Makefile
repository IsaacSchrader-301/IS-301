# Makefile for Oregon Wine Country Soils solutions
# Author: Isaac Schrader

PACKAGE_NAME = wine_soils_package.zip
ASSETS = awkDelimiter.sh awkReplace.sh delimiterTool.sh grepDelimiter.sh grepName.sh sedDelimiter.sh sedReplace.sh OregonWineCountrySoils.txt 

help:
	@echo "----------------------------------------------------"
	@echo " Developer: Isaac Schrader"
	@echo " Usage:"
	@echo "   make build   -> Bundle solution assets into $(PACKAGE_NAME)"
	@echo "   make deploy  -> Commit and push $(PACKAGE_NAME) to class git repo"
	@echo "   make demo    -> Run sample demonstrations of all scripts"
	@echo "   make test    -> Run all scripts against dataset and save outputs"
	@echo "   make clean   -> Remove generated package and test outputs"
	@echo "   make all     -> Run build, demo, test, deploy, and clean in sequence"
	@echo "----------------------------------------------------"

build: $(ASSETS)
	zip -r $(PACKAGE_NAME) $(ASSETS)

deploy: build
	git add $(PACKAGE_NAME)
	git commit -m "Deploy Oregon Wine Country Soils solution package"
	git push

demo:
	@echo "foo : bar" | ./awkDelimiter.sh '[[:space:]]:' ", "
	@echo "Lizzy went home" | ./awkReplace.sh Lizzy Elizabeth
	@echo "foo : bar" | ./delimiterTool.sh --grep '[[:space:]]:'
	@echo "foo : bar" | ./delimiterTool.sh --awk '[[:space:]]:' ", "
	@echo "foo : bar" | ./delimiterTool.sh --sed '[[:space:]]:' ", "
	@echo "foo : bar" | ./grepDelimiter.sh '[[:space:]]:'
	@echo "Lizzy went home" | ./grepName.sh Lizzy
	@echo "foo : bar" | ./sedDelimiter.sh '[[:space:]]:' ", "
	@echo "Lizzy went home" | ./sedReplace.sh Lizzy Elizabeth

test:
	cat OregonWineCountrySoils.txt | ./awkDelimiter.sh '[[:space:]]:' ", " > output_awkDelimiter.txt
	cat OregonWineCountrySoils.txt | ./awkReplace.sh Jory "Jory Soil" > output_awkReplace.txt
	cat OregonWineCountrySoils.txt | ./delimiterTool.sh --awk '[[:space:]]:' ", " > output_delimiterTool_awk.txt
	cat OregonWineCountrySoils.txt | ./delimiterTool.sh --sed '[[:space:]]:' ", " > output_delimiterTool_sed.txt
	cat OregonWineCountrySoils.txt | ./grepDelimiter.sh '[[:space:]]:' > output_grepDelimiter.txt
	cat OregonWineCountrySoils.txt | ./grepName.sh Jory > output_grepName.txt
	cat OregonWineCountrySoils.txt | ./sedDelimiter.sh '[[:space:]]:' ", " > output_sedDelimiter.txt
	cat OregonWineCountrySoils.txt | ./sedReplace.sh Jory "Jory Soil" > output_sedReplace.txt
	@echo "All tests complete. Outputs saved to output_*.txt files."

clean:
	rm -f $(PACKAGE_NAME) output_*.txt

all: build demo test deploy clean

