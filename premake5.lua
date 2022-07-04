workspace "darkengine"
    startproject "darkeditor"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release"
    }

tdir = "bin/%{cfg.buildcfg}/%{prj.name}"
odir = "bin-obj/%{cfg.buildcfg}/%{prj.name}"

-- External Dependencies
externals = {}
externals["maclibs"] = "external/maclibs"
externals["sdl2"] = "external/sdl2"

project "darkengine"
    location "darkengine"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir(tdir)
    objdir(odir)

    files
    {
        "%{prj.name}/include/**.h",
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp",
    }

    sysincludedirs
    {
        "%{prj.name}/include/darkengine",
        "%{externals.sdl2}/include",
    }

    flags
    {
        "FatalWarnings"
    }

    filter {"system:windows", "configurations:*"}
        systemversion "latest"

        defines
        {
            "DARK_PLATFORM_WINDOWS"
        }

    filter {"system:macosx", "configurations:*"}
        xcodebuildsettings
        {
            ["MACOSX_DEPLOYMENT_TARGET"] = "10.15",
            ["UseModernBuildSystem"] = "NO"
        }

        defines
        {
            "DARK_PLATFORM_MAC"
        }

    
    filter {"system:linux", "configurations:*"}
        defines
        {
            "DARK_PLATFORM_LINUX"
        } 
        

    filter "configurations:Debug"
        defines
        {
            "DARK_CONFIG_DEBUG"
        }
        runtime "Debug"
        symbols "on"

    
    filter "configurations:Release"
        defines
        {
            "DARK_CONFIG_RELEASE"
        }
        runtime "Release"
        symbols "off"
        optimize "on"   



project "darkeditor"
    location "darkeditor"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    links "darkengine" 

    targetdir(tdir)
    objdir(odir)
    
    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp",
    }

    sysincludedirs
    {
        "darkengine/include",
    }

    flags
    {
        "FatalWarnings"
    }

    filter {"system:windows", "configurations:*"}
        systemversion "latest"

        defines
        {
            "DARK_PLATFORM_WINDOWS"
        }

        libdirs
        {
            "%{externals.sdl2}/lib"
        }

        links
        {
            "SDL2"
        }

    filter {"system:macosx", "configurations:*"}
        xcodebuildsettings
        {
            ["MACOSX_DEPLOYMENT_TARGET"] = "10.15",
            ["UseModernBuildSystem"] = "NO"
        }

        defines
        {
            "DARK_PLATFORM_MAC"
        }

        abspath = path.getabsolute("%{externals.maclibs}")
        linkoptions {"-F " .. abspath}
        
        links
        {
            "SDL2.framework",
        }

    
    filter {"system:linux", "configurations:*"}
        defines
        {
            "DARK_PLATFORM_LINUX"
        } 
        

    filter "configurations:Debug"
        defines
        {
            "DARK_CONFIG_DEBUG"
        }
        runtime "Debug"
        symbols "on"

    
    filter "configurations:Release"
        defines
        {
            "DARK_CONFIG_RELEASE"
        }
        runtime "Release"
        symbols "off"
        optimize "on"   