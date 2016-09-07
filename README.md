# Boards

Infinite whiteboards

## Status

Not finished

## Usage

Best used with a tablet. Boards are saved to local storage and restored whenever you start the app.

* Click and drag to draw. There is only one color and thickness. There is no eraser.
* Hold `P` and drag the mouse to move the drawing around. The space is infinite.
* Press `Z` to undo your last pen stroke. You have infinite undos. There is no redo.
* Press `N` to start a new blank board.
* Press `S` to upload to a gist. You will be prompted for a username, password, and title. A shareable [RawGit](https://rawgit.com/) URL will be opened in your default browser.
* Press `D` to save the board to disk.

## Building

Run `./build.sh`. Requires `npm` and [`electron-packager`](https://github.com/electron-userland/electron-packager). Only OSX at the moment.

## To do

* Open old boards
* Images
* Zooming

## License

Copyright © Ramsey Nasser 2015. Provided under the [MIT License](http://opensource.org/licenses/MIT).
