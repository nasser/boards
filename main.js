const {BrowserWindow, app} = require('electron');
const os = require('os');
const path = require('path');

let win;

function createWindow() {
  win = new BrowserWindow({width: 800, height: 600, titleBarStyle: 'hidden-inset'});
  win.loadURL(`file:///${__dirname}/index.html`);
}

app.on('ready', createWindow);

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

app.on('activate', () => {
  if (win === null) {
    createWindow();
  }
});
