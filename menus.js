const {Menu, MenuItem} = require("electron").remote;

const template = [
  {
    label:'Board',
    submenu: [
      {
        label: 'New',
        enabled: false
      },
      {
        label: 'Clear',
        accelerator: 'CmdOrCtrl+N',
        click(item, focusedWindow) {
          newBoard();
        }
      },
      {
        label: 'Save HTML...',
        accelerator: 'CmdOrCtrl+S',
        click(item, focusedWindow) {
          download();
        }
      },
      {
        label: 'Save SVG...',
        enabled: false
      },
      {
        label: 'Upload Gist...',
        accelerator: 'CmdOrCtrl+U',
        click(item, focusedWindow) {
          save();
        }
      }
    ]
  },
  {
    label: 'Edit',
    submenu: [
    {
      label: 'Undo',
      accelerator: 'CmdOrCtrl+Z',
      click() {
        root().removeChild(lastMark());
      }
    },
    {
      type: 'separator'
    },
    {
      label: 'Copy Image',
      enabled: false
    },
    {
      label: 'Copy SVG',
      enabled: false
    },
    // {
    //   role: 'cut'
    // },
    // {
    //   role: 'copy'
    // },
    {
      role: 'paste'
    },
    // {
    //   role: 'pasteandmatchstyle'
    // },
    // {
    //   role: 'delete'
    // },
    // {
    //   role: 'selectall'
    // },
    ]
  },
  {
    label: 'View',
    submenu: [
      {
        label: 'Reload',
        accelerator: 'CmdOrCtrl+R',
        click(item, focusedWindow) {
          if (focusedWindow) focusedWindow.reload();
        }
      },
      {
        role: 'togglefullscreen'
      },
      {
        label: 'Toggle Developer Tools',
        accelerator: process.platform === 'darwin' ? 'Alt+Command+I' : 'Ctrl+Shift+I',
        click(item, focusedWindow) {
          if (focusedWindow)
            focusedWindow.webContents.toggleDevTools();
        }
      },
    ]
  },
  {
    role: 'window',
    submenu: [
      {
        role: 'minimize'
      },
      {
        role: 'close'
      },
    ]
  },
  {
    role: 'help',
    submenu: [
      {
        label: 'Learn More',
        click() { require('electron').shell.openExternal('https://github.com/nasser/boards'); }
      },
      {
        label: 'Open Introduction Board',
        enabled: false
      },
    ]
  },
];

if (process.platform === 'darwin') {
  const name = require('electron').remote.app.getName();
  template.unshift({
    label: name,
    submenu: [
      {
        role: 'about'
      },
      {
        type: 'separator'
      },
      {
        role: 'services',
        submenu: []
      },
      {
        type: 'separator'
      },
      {
        role: 'hide'
      },
      {
        role: 'hideothers'
      },
      {
        role: 'unhide'
      },
      {
        type: 'separator'
      },
      {
        role: 'quit'
      },
    ]
  });
  // Window menu.
  template[4].submenu = [
    {
      label: 'Close',
      accelerator: 'CmdOrCtrl+W',
      role: 'close'
    },
    {
      label: 'Minimize',
      accelerator: 'CmdOrCtrl+M',
      role: 'minimize'
    },
    {
      label: 'Zoom',
      role: 'zoom'
    },
    {
      type: 'separator'
    },
    {
      label: 'Bring All to Front',
      role: 'front'
    }
  ];
}

const menu = Menu.buildFromTemplate(template);
Menu.setApplicationMenu(menu);