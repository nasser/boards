PACKAGER-FLAGS=. Boards --asar --ignore "out"

all: darwin windows linux
	
darwin: Boards-darwin-x64
Boards-darwin-x64: 
	electron-packager $(PACKAGER-FLAGS) --icon=boards.icns --platform=darwin --arch=x64
	mkdir -p out
	cp -r Boards-darwin-x64 out/
	rm -fr Boards-darwin-x64

linux: Boards-linux-ia32 Boards-linux-x64
Boards-linux-ia32:
	electron-packager $(PACKAGER-FLAGS) --platform=linux --arch=ia32
	mkdir -p out
	cp -r Boards-linux-ia32 out/
	rm -fr Boards-linux-ia32
	
Boards-linux-x64:
	electron-packager $(PACKAGER-FLAGS) --platform=linux --arch=x64
	mkdir -p out
	cp -r Boards-linux-x64 out/
	rm -fr Boards-linux-x64

windows: Boards-win32-ia32 Boards-win32-x64
Boards-win32-ia32:
	electron-packager $(PACKAGER-FLAGS) --platform=win32 --arch=ia32
	mkdir -p out
	cp -r Boards-win32-ia32 out/
	rm -fr Boards-win32-ia32
	
Boards-win32-x64:
	electron-packager $(PACKAGER-FLAGS) --platform=win32 --arch=x64
	mkdir -p out
	cp -r Boards-win32-x64 out/
	rm -fr Boards-win32-x64

clean:
	rm -fr Boards-*