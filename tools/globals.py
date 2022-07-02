ENGINE_NAME = "darkengine"
PROJECT_NAME = "darkeditor"
TOOLS_DIR = "tools"

V_MAJOR = 1
V_MINOR = 0

import sys, platform

PLATFORM = sys.platform

for x in platform.uname():
    if "microsoft" in x.lower():
        PLATFORM = "windows"
        break

def IsWindows():
    return PLATFORM == "windows" or PLATFORM == "win32"

def IsLinux():
    return PLATFORM == "linux"

def IsMac():
    return PLATFORM == "darwin"