# Boards

Infinite whiteboards

## Status

Not finished

## Usage

Best used with a tablet. Boards are saved to local storage and restored whenever you start the app.

* Click and drag to draw. There is only one color and thickness. There is no eraser.
* Right click and drag the mouse or two-finger scroll your trackpad to move the drawing around. The space is infinite.
* Press `Cmd+Z` to undo your last pen stroke. You have infinite undos. There is no redo.
* Press `Cmd+N` to start a new blank board.
* Press `Cmd+U` to upload to a gist. You will be prompted for your GitHub username, password, and title. A shareable [RawGit](https://rawgit.com/) URL will be opened in your default browser.
* Press `Cmd+S` to save the board to disk.

## Building

```
$ npm install
$ make
```

Requires `npm` and [`electron-packager`](https://github.com/electron-userland/electron-packager). Only tested on OSX. Prebuilt packages soon.

## License

Copyright © Ramsey Nasser 2015-2016. Provided under the [MIT License](http://opensource.org/licenses/MIT).
