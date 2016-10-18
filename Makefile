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

publish:
	butler push Boards-darwin-x64 nasser/boards:osx-x64
	butler push Boards-linux-ia32 nasser/boards:linux-ia32
	butler push Boards-linux-x64 nasser/boards:linux-x64
	butler push Boards-win32-ia32 nasser/boards:win32-ia32
	butler push Boards-win32-x64 nasser/boards:win32-x64

clean:
	rm -fr Boards-*