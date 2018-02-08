ifdef VERSION
else
	include version.mk
endif

sha:
	curl https://codeload.github.com/anycable/anycable-go/tar.gz/v$(VERSION) -o archive.tar.gz
	shasum -a 256 archive.tar.gz
	rm archive.tar.gz
