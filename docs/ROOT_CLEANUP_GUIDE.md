# Root cleanup guide

The root folder should have one AI entry point only.

Recommended root files:

```text
Start.bat
AI_CATALOG.bat
SHARE_ENV_TO_AI.bat
README.md
```

Remove old model-specific root shortcuts:

```text
Install-AI.bat
YOLO_INSTALL.bat
YOLO_RUN.bat
WHISPER_INSTALL.bat
TRANSFORMERS_INSTALL.bat
```

The actual installers stay in `tools/`.
