#include "darkengine/engine.h"

int main(int argc, char* argv){

    dengine::Engine& engine = dengine::Engine::Instance();
    engine.Run();

    std::cout << "Press ENTER to continue... ";
    std::cin.ignore();

   return 0;

}