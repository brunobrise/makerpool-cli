# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
BINARY_PATH=./bin/
BINARY_NAME=makerpool-cli
BINARY_UNIX=$(BINARY_NAME)_unix

all: test build
build: 
		$(GOBUILD) -o $(BINARY_PATH)$(BINARY_NAME) -v
test: 
		$(GOTEST) -v $(BINARY_PATH)
clean: 
		$(GOCLEAN)
		rm -f $(BINARY_NAME)
		rm -f $(BINARY_UNIX)
run:
		$(GOBUILD) -o $(BINARY_PATH)$(BINARY_NAME) -v ./...
		$(BINARY_PATH)$(BINARY_NAME)
deps:
		$(GOGET) github.com/markbates/goth
		$(GOGET) github.com/markbates/pop


# Cross compilation
build-linux:
		CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_PATH)$(BINARY_UNIX) -v