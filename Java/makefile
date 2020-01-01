PROJECT_NAME = project
CLASS_PATH = src/main/java/
MANIFEST_FILE = manifest.mf
JAVA = java
JAVAC = javac
SOURCES = $(shell find . -type f -iname "*.java")
CLASSES = $(SOURCES:.java=.class)

.PHONY: default help compile jar run clean

default: jar

help:
	@echo "'make clean': Cleans up generated files."
	@echo "'make compile': Compile the project."
	@echo "'make jar': Build a executable Jar file."
	@echo "'make run': Run the project."
	@echo

compile: $(CLASSES)

%.class: %.java
	@echo "Compiling the project..."
	@$(JAVAC) -classpath $(CLASS_PATH) $<
	@echo "Done!"
	@echo

jar: $(PROJECT_NAME).jar
$(PROJECT_NAME).jar: $(CLASSES)
	@echo "Building a executable Jar file..."
	@echo "Manifest-Version: 1.0" > $(MANIFEST_FILE)
	@echo "Class-Path: $(CLASS_PATH)" >> $(MANIFEST_FILE)
	@echo "Main-Class: Main" >> $(MANIFEST_FILE)
	@jar cvfm $(PROJECT_NAME).jar $(MANIFEST_FILE) $(CLASSES)
	@echo "Done!"
	@echo

run: $(PROJECT_NAME).jar
	@echo "Running the project..."
	@$(JAVA) -jar $(PROJECT_NAME).jar
	@echo "Done!"
	@echo

clean:
	@echo "Cleaning up generated files..."
	@rm -f $(PROJECT_NAME).jar
	@rm -f $(MANIFEST_FILE)
	@rm -f $(CLASSES)
	@echo "Done!"
	@echo
