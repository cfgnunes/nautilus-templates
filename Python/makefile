VENV_DIR=.venv
VENV_ACTIVATE=$(VENV_DIR)/bin/activate
PYTHON=$(VENV_DIR)/bin/python
REQUIRIMENTS_FILE=requirements.txt

.PHONY: default help venv lint run clean

default: run

help:
	@echo "'make clean': Cleans up generated files."
	@echo "'make lint': Run a linter in all code."
	@echo "'make run': Run the project."
	@echo "'make venv': Prepare development environment."
	@echo

venv: $(VENV_ACTIVATE)
$(VENV_ACTIVATE): $(REQUIRIMENTS_FILE)
	@echo "Creating a virtualenv..."
	@python3 -m venv "$(VENV_DIR)"
	@echo "Installing packages in the virtualenv..."
	@. $(VENV_ACTIVATE); \
		pip3 install --upgrade pip setuptools; \
		pip3 install --upgrade --requirement $(REQUIRIMENTS_FILE)
	@touch $(VENV_ACTIVATE)
	@echo "Done!"
	@echo

lint: venv
	@echo "Running linters..."
	@. $(VENV_ACTIVATE); $(PYTHON) -m flake8 *.py
	@. $(VENV_ACTIVATE); $(PYTHON) -m pylint \
		--ignored-modules=cv2 \
		--disable=invalid-name \
		--disable=missing-docstring \
		--disable=duplicate-code *.py
	@echo "Done!"
	@echo

run: venv
	@echo "Running the project..."
	@. $(VENV_ACTIVATE); $(PYTHON) main.py
	@echo "Done!"
	@echo

clean:
	@echo "Cleaning up generated files..."
	@rm -rf $(VENV_DIR)
	@find . -type d -iname "__pycache__" ! -path "./.git/*" -exec rm -rf {} \+
	@find . -type f -iname "*.py[cod]" ! -path "./.git/*" -delete
	@echo "Done!"
	@echo
