# WinPython guide

This environment uses WinPython as the only base Python runtime.

## Required layout

Extract WinPython under:

```text
winpython/
```

Expected example:

```text
winpython/WPy64-3.12.x/python/python.exe
```

## Important

Do not commit WinPython itself to GitHub. It is large.
Use GitHub Releases, OneDrive, or a lab shared drive for completed packages.

## How it works

- `Start.bat` checks `winpython/**/python/python.exe`.
- AI tools create isolated `.venv` environments using that WinPython python.exe.
- `uv` and Conda are not used.
