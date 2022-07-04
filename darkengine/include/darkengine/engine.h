#pragma once

#include <iostream>
#include "core/window.h"

namespace dengine{

    class Engine {

        public:
            static Engine& Instance();
            ~Engine(){}

            void Run();
            inline void Quit() { mIsRunning = false; }

        private:
            void GetInfo();
            [[nodiscard]] bool Initialize();
            void Shutdown();
    
            bool mIsRunning;
            core::Window mWindow;

            //Singleton
            Engine();
            static Engine* mInstance;
    };
    
}