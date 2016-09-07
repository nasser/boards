#!/bin/sh
npm install
electron-packager . Boards --platform=darwin --arch=x64 --icon=boards.icns
