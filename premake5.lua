workspace "darkengine"
    startproject "darkeditor"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release"
    }


    
project "darkeditor"
    location "darkeditor"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    systemversion "latest"

    
    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp",
    }

    flags
    {
        "FatalWarnings"
    }

    