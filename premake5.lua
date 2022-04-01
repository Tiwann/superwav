workspace "superwav"
    architecture "x86_64"
    startproject "superwav"
    configurations { "Debug", "Release" }
    flags "MultiProcessorCompile"

bindir = "binaries"
intdir = "binaries-int"

newaction 
{
    trigger = "clean",
    description = "Clean all the generated files",
    
    onStart = function()
        print("Cleaning all the generated files...")
    end,

    execute = function()
        os.rmdir("binaries")
        os.rmdir("binaries-int")
        os.rmdir(".vs")
        os.rmdir(".idea")
        os.remove("**.vcxproj")
        os.remove("**.vcxproj.filters")
        os.remove("**.vcxproj.user")
        os.remove("**.sln")
        os.remove("**.make")
        os.remove("**Makefile")
    end,

    onEnd = function()
        print("Done.")
    end
}

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
        symbols "on"
        defines "DEBUG"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

project "wavlib"
    location "wavlib"
    kind "sharedlib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir(bindir)
    objdir(intdir)

    files
    {
        "%{prj.location}/include/*.h",
        "%{prj.location}/source/*.cpp",
    }

    includedirs
    {
        "%{prj.location}/include"
    }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
