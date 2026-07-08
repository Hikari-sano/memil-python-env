# WinPython beginner guide

## What is WinPython?

WinPython is the Python runtime used by this environment. It is portable, so it can live inside this project folder.

## What you need to do

### 1. Run the helper

Double-click:

```text
WINPYTHON_SETUP.bat
```

The helper opens the WinPython download page and creates this folder:

```text
winpython/
```

### 2. Download WinPython

Download a 64-bit WinPython package from the WinPython page.
For AI tools, Python 3.12 is recommended when available.

### 3. Extract WinPython

Extract WinPython into the `winpython` folder.

The expected layout is:

```text
memil-python-env/
└─ winpython/
   └─ WPy64-xxxx/
      └─ python/
         └─ python.exe
```

### 4. Check WinPython

Run:

```text
WINPYTHON_SETUP.bat
```

again, or run:

```text
tools/check-winpython.ps1
```

If the check passes, run:

```text
Start.bat
```

## Common mistakes

### Wrong layout

This is wrong:

```text
winpython/
└─ python.exe
```

This is also wrong:

```text
winpython/
└─ Downloads/
   └─ WPy64-xxxx/
```

Correct example:

```text
winpython/
└─ WPy64-xxxx/
   └─ python/
      └─ python.exe
```

## Do not upload WinPython to GitHub

The `winpython/` folder is local only. Do not commit it to GitHub.
