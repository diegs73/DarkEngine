#include "engine.h"
#include "SDL2/SDL.h"


namespace dengine{

    Engine& Engine::Instance() {
        if (!mInstance) {
            mInstance = new Engine();
        }

        return *mInstance;
    }

    void Engine::Run() {
        if (Initialize()) {
            //CORE LOOP
            while (mIsRunning) {
                mWindow.PumpEvents();
            }
            Shutdown();
        }
    }


    //private
    bool Engine::Initialize() {

        bool ret = false;

        if (SDL_Init(SDL_INIT_EVERYTHING) < 0) { 
            std::cout << "Error initializing SDL2: " << SDL_GetError() << std::endl;
        }
        else {
            SDL_version version;
            SDL_VERSION(&version);
            std::cout << "SDL " << (int32_t)version.major << "." << (int32_t)version.minor << "." << (int32_t)version.patch << std::endl;
            
            if (mWindow.Create()) {
                ret = true;
                mIsRunning = true;
            }
        }

        if (!ret) {
            std::cout << "Engine initialization failed. Shutting down." << std::endl;
            Shutdown();
        }

        return ret;
    }

    void Engine::Shutdown() {
        mIsRunning = false;
        mWindow.Shutdown();
        SDL_Quit();
    }
    void Engine::GetInfo(){
        #ifdef DARK_CONFIG_DEBUG
            std::cout << "Configuration: DEBUG" << std::endl;
        #endif
        #ifdef DARK_CONFIG_RELEASE
            std::cout << "Configuration: RELEASE" << std::endl;
        #endif
        #ifdef DARK_PLATFORM_WINDOWS
            std::cout << "Platform: WINDOWS" << std::endl;
        #endif
        #ifdef DARK_PLATFORM_LINUX
            std::cout << "Platform: LINUX" << std::endl;
        #endif
        #ifdef DARK_PLATFORM_MAC
            std::cout << "Platform: MAC" << std::endl;
        #endif
    }

    //singleton
    Engine* Engine::mInstance = nullptr;
    Engine::Engine() : mIsRunning(false) {
        GetInfo();
    }

}