require "cleanup"

workspace "superwav"
    architecture "x86_64"
    startproject "superwav"
    configurations { "Debug", "Release" }
    flags "MultiProcessorCompile"

bindir = "%{wks.location}/binaries"
intdir = "%{wks.location}/binaries-obj"


project "superwav"
    location "superwav"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    systemversion "latest"

    targetdir(bindir)
    objdir(intdir)

    files
    {
        "%{prj.location}/**.h",
        "%{prj.location}/**.cpp",
    }

    includedirs
    {
        "%{wks.location}/vendor/wavlib/include",
    }

    defines
    {

    }
    
    links 
    {
        "wavlib",
        
    }

    filter "system:windows"
        defines "_CRT_SECURE_NO_WARNINGS"

    

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"


include "vendor/wavlib"
