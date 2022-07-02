import subprocess
import globals

CONFIG = "debug"


if globals.IsWindows():
    VS_BUILD_PATH = "Program Files/Microsoft Visual Studio/2022/Community/Msbuild/Current/Bin/MSBuild.exe"
    VS_BUILD_PATH = "C:\\\\" + VS_BUILD_PATH
    subprocess.call(["cmd.exe", "/c", VS_BUILD_PATH, "{}.sln".format(globals.ENGINE_NAME), "/property:Configuration={}".format(CONFIG)])
