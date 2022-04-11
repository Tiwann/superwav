#include <wavlib/wav.h>
#include <fmod.hpp>
#include <iostream>
#include <Windows.h>
#include <mmsystem.h>

#define SUPERWAV_VERSION_MAJOR 0
#define SUPERWAV_VERSION_MINOR 1

int main(const int argc, const char** argv)
{
    
    // Initialize FMOD Core API
    FMOD::System* fsystem = nullptr;
    if(System_Create(&fsystem) != FMOD_OK)
    {
        std::cerr << "Failed to Create FMOD System" << std::endl;
    }
    
    if(fsystem->init(0, FMOD_INIT_NORMAL, nullptr) != FMOD_OK)
    {
        std::cerr << "Failed to init FMOD System!" << std::endl;
    }
   
    std::cout << "Using FMOD Core version: "
    << (FMOD_VERSION >> 16 & 0xFF) << "."
    << (FMOD_VERSION >> 8 & 0xFF) << "."
    << (FMOD_VERSION & 0xFF) << std::endl;
    
    
    std::cout << "Welcome to superwav version " << SUPERWAV_VERSION_MAJOR << "." << SUPERWAV_VERSION_MINOR << std::endl;
    wavlib::wav audio(R"(C:\Users\Tiwann\Desktop\Start Your Engines.wav)");
    const auto t = audio.read_pcm_frames_f32(0);
    
    std::cout << "Weledgzgr " << std::endl;
 
    return 0;
}
