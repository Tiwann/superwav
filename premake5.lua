require "cleanup"

workspace "superwav"
	architecture "x64"
	startproject "superwav"
	configurations { "Debug", "Release" }
	flags "MultiProcessorCompile"

bindir = "%{wks.location}/binaries/%{cfg.architecture}"
intdir = "%{wks.location}/binaries-int/%{cfg.architecture}"


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
		"%{wks.location}/vendor/fmod/inc",
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
		libdirs "%{wks.location}/vendor/fmod/lib/win32"
		links "fmod"

	filter "system:linux"
	libdirs "%{wks.location}/vendor/fmod/lib/unix"
		links "libfmod"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"


include "vendor/wavlib"
