PACKAGER-FLAGS=. Boards --asar --ignore "Boards"

all: darwin windows linux
	
darwin: Boards-darwin-x64
Boards-darwin-x64:
	electron-packager $(PACKAGER-FLAGS) --icon=boards.icns --platform=darwin --arch=x64

linux: Boards-linux-ia32 Boards-linux-x64
Boards-linux-ia32:
	electron-packager $(PACKAGER-FLAGS) --platform=linux --arch=ia32
	
Boards-linux-x64:
	electron-packager $(PACKAGER-FLAGS) --platform=linux --arch=x64

windows: Boards-win32-ia32 Boards-win32-x64
Boards-win32-ia32:
	electron-packager $(PACKAGER-FLAGS) --platform=win32 --arch=ia32
	
Boards-win32-x64:
	electron-packager $(PACKAGER-FLAGS) --platform=win32 --arch=x64

clean:
	rm -fr Boards-*