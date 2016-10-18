PACKAGER-FLAGS=. Boards --asar --ignore "Boards" --ignore "dist"
DIST=dist

all: darwin windows linux
	
darwin: $(DIST)/Boards-darwin-x64.dmg
$(DIST)/Boards-darwin-x64.dmg: 
	mkdir -p $(DIST)
	electron-packager $(PACKAGER-FLAGS) --icon=boards.icns --platform=darwin --arch=x64
	rm Boards-darwin-x64/LICENSE
	rm Boards-darwin-x64/LICENSES.chromium.html
	rm Boards-darwin-x64/version
	cp LICENSE Boards-darwin-x64/
	ln -s /Applications Boards-darwin-x64/Applications
	hdiutil create -format UDZO -srcfolder Boards-darwin-x64 Boards-darwin-x64.dmg
	mv Boards-darwin-x64.dmg $(DIST)
	rm -fr Boards-darwin-x64

linux: $(DIST)/Boards-linux-ia32.zip $(DIST)/Boards-linux-x64.zip
$(DIST)/Boards-linux-ia32.zip:
	electron-packager $(PACKAGER-FLAGS) --platform=linux --arch=ia32
	zip -9r -x"*.DS_Store" $(DIST)/Boards-linux-ia32.zip Boards-linux-ia32
	rm -fr Boards-linux-ia32
	
$(DIST)/Boards-linux-x64.zip:
	electron-packager $(PACKAGER-FLAGS) --platform=linux --arch=x64
	zip -9r -x"*.DS_Store" $(DIST)/Boards-linux-x64.zip Boards-linux-x64
	rm -fr Boards-linux-x64

windows: $(DIST)/Boards-win32-ia32.zip $(DIST)/Boards-win32-x64.zip
$(DIST)/Boards-win32-ia32.zip:
	electron-packager $(PACKAGER-FLAGS) --platform=win32 --arch=ia32
	zip -9r -x"*.DS_Store" $(DIST)/Boards-win32-ia32.zip Boards-win32-ia32
	rm -fr Boards-win32-ia32
	
$(DIST)/Boards-win32-x64.zip:
	electron-packager $(PACKAGER-FLAGS) --platform=win32 --arch=x64
	zip -9r -x"*.DS_Store" $(DIST)/Boards-win32-x64.zip Boards-win32-x64
	rm -fr Boards-win32-x64

clean:
	rm -fr $(DIST)