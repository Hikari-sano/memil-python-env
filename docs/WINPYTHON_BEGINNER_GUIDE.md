# WinPython beginner guide

## Recommended WinPython

For this environment, use this WinPython download page:

```text
https://sourceforge.net/projects/winpython/files/WinPython_3.12/3.12.10.1/
```

Recommended file:

```text
Winpython64-3.12.10.1dot.exe
```

If you prefer ZIP extraction, this is also OK:

```text
Winpython64-3.12.10.1dot.zip
```

## Why this version?

This project currently recommends WinPython 3.12.10.1 because it uses Python 3.12 and is suitable for the per-tool `.venv` workflow used by this environment.

## Setup steps

1. Double-click:

```text
WINPYTHON_SETUP.bat
```

2. Choose:

```text
1. Open recommended WinPython download page
```

3. Download:

```text
Winpython64-3.12.10.1dot.exe
```

4. Extract WinPython into:

```text
winpython/
```

5. The final layout should look like this:

```text
memil-python-env/
└─ winpython/
   └─ WPy64-xxxx/
      └─ python/
         └─ python.exe
```

6. Run `WINPYTHON_SETUP.bat` again.
7. Choose:

```text
3. Check WinPython placement
```

8. If the check succeeds, run:

```text
Start.bat
```

## Common mistakes

Wrong:

```text
winpython/
└─ python.exe
```

Wrong:

```text
winpython/
└─ Downloads/
   └─ WPy64-xxxx/
      └─ python/
         └─ python.exe
```

Correct:

```text
winpython/
└─ WPy64-xxxx/
   └─ python/
      └─ python.exe
```

## For beginners

If possible, use a ready-made lab distribution ZIP instead of downloading WinPython manually.

If you must download manually, open this page and choose `Winpython64-3.12.10.1dot.exe`:

```text
https://sourceforge.net/projects/winpython/files/WinPython_3.12/3.12.10.1/
```
