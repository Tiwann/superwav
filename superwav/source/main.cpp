#include <wavlib.h>
#include <generator.h>

int main(const int argc, const char** argv)
{
    wavlib::wav audio(R"(C:\Users\Tiwann\Desktop\Start Your Engines.wav)");

    
    //wavlib::generators::square square(1.0f, 440, 0.5f);
    //audio = square.towav();
    //audio.write_to_file("square.wav");

    //wavlib::generators::triangle tri(1.0f, 440, 0.5f); 
    //audio = tri.towav();
    //audio.write_to_file("triangle.wav");

    return 0;
}