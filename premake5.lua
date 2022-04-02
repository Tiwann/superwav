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
    systemversion "Latest"

    targetdir(bindir)
    objdir(intdir)

    files
    {
        "%{prj.location}/**.h",
        "%{prj.location}/**.cpp",
    }

    includedirs
    {
        "wavlib/include"
    }

    defines
    {

    }

    filter "system:windows"
        defines "_CRT_SECURE_NO_WARNINGS"

    links "wavlib"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"

include "wavlib"