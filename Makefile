build:
	swift build

test:
	swift test

unit_test_docker:
	docker run --rm -v $(shell pwd):/src -w /src ibmcom/kitura-ubuntu /bin/bash -c 'swift test --build-path=/.build' 
