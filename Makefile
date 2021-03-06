LD_FLAGS = -H windowsgui
LD_FLAGS_RELEASE = -s -w

build:
	go build -ldflags="$(LD_FLAGS)"

# Needs: go get github.com/ahmetb/govvv
release:
	govvv build -ldflags="$(LD_FLAGS) $(LD_FLAGS_RELEASE)"

# Needs: go get github.com/akavel/rsrc
resources:
	rsrc -manifest gunarchiver.manifest -ico gunarchiver.ico -o rsrc.syso
	
clean:
	rm gunarchiver.exe gunarchiver-win64.zip

dist: release
	zip gunarchiver-win64.zip gunarchiver.exe README.md CHANGELOG.md LICENSE VERSION

test:
	go test ./...
