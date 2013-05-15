#ifdef WIN32
#   include <GL/glew.h>
#else
#   define GL3_PROTOTYPES 1
#   include <GL3/gl3.h>
#endif

#include <SDL2/SDL.h>
#include <iostream>

#include  "MovingRectangle.h"

int main(int argc, char **argv)
{
    // Notre fenêtre
    SDL_Window* fenetre(0);
    SDL_GLContext contexteOpenGL(0);
    SDL_Event evenements;
    bool terminer(false);

    // Initialisation de la SDL
    if(SDL_Init(SDL_INIT_VIDEO) < 0)
    {
        std::cout << "Erreur lors de l'initialisation de la SDL : " << SDL_GetError() << std::endl;
        SDL_Quit();
        return -1;
    }

    // Version d'OpenGL
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 1);


    // Double Buffer
    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
    SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 24);


    // Création de la fenêtre
    fenetre = SDL_CreateWindow("Test SDL 2.0", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 700, 700, SDL_WINDOW_SHOWN | SDL_WINDOW_OPENGL);
    if(fenetre == 0)
    {
        std::cout << "Erreur lors de la creation de la fenetre : " << SDL_GetError() << std::endl;
        SDL_Quit();
        return -1;
    }

    // Création du contexte OpenGL
    contexteOpenGL = SDL_GL_CreateContext(fenetre);
    if(contexteOpenGL == 0)
    {
        std::cout << SDL_GetError() << std::endl;
        SDL_DestroyWindow(fenetre);
        SDL_Quit();
        return -1;
    }


    #ifdef WIN32
        // On initialise GLEW
        GLenum initialisationGLEW( glewInit() );
        // Si l'initialisation a échouée :
        if(initialisationGLEW != GLEW_OK)
        {
            // On affiche l'erreur grâce à la fonction : glewGetErrorString(GLenum code)
            std::cout << "Erreur d'initialisation de GLEW : " << glewGetErrorString(initialisationGLEW) << std::endl;
            // On quitte la SDL
            SDL_GL_DeleteContext(contexteOpenGL);
            SDL_DestroyWindow(fenetre);
            SDL_Quit();
            return -1;
        }
    #endif


    // Vertices et coordonnées
    float vertices[] = {-0.5, -0.5,   0.0, 0.5,   0.5, -0.5};

    MovingRectangle** rectangles = new MovingRectangle* [4];
    rectangles[0] = new MovingRectangle(-0.2, -0.2, 0.2, 0.2);
    rectangles[0]->setDirectionX(-0.5);
    rectangles[0]->setDirectionY(0.3);
    rectangles[0]->setSpeed(0.01);
    rectangles[1] = new MovingRectangle(-0.5, -0.5, -0.3, -0.3);
    rectangles[1]->setDirectionX(0.2);
    rectangles[1]->setDirectionY(0.7);
    rectangles[1]->setSpeed(0.02);
    rectangles[2] = new MovingRectangle(0.4, 0.3, 0.5, 0.5);
    rectangles[2]->setDirectionX(0.7);
    rectangles[2]->setDirectionY(0.8);
    rectangles[2]->setSpeed(0.005);
    rectangles[3] = new MovingRectangle(0, 0.3, 0.4, 0.4);
    rectangles[3]->setDirectionX(-0.2);
    rectangles[3]->setDirectionY(0.2);
    rectangles[3]->setSpeed(0.01);

    // Boucle principale
    while(!terminer)
    {
        // Gestion des évènements
        SDL_PollEvent(&evenements);
        if(evenements.window.event == SDL_WINDOWEVENT_CLOSE)
            terminer = true;

        // Nettoyage de l'écran
        glClear(GL_COLOR_BUFFER_BIT);

        // On remplie puis on active le tableau Vertex Attrib 0
        glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, 0, vertices);
        glEnableVertexAttribArray(0);

        // On affiche le rectangle
        for (int i = 0; i < 4; ++i)
        {
            MovingRectangle* rect = rectangles[i];

            //collisions
            //collisions murs
            if (rect->getX1() <= -1.0 || rect->getX2() >= 1.0)
                rect->setDirectionX(-rect->getDirectionX());
            else
            {
                if (rect->getY1() <= -1.0 || rect->getY2() >= 1.0)
                    rect->setDirectionY(-rect->getDirectionY());
                else
                {
                    //collision entre objects
                    ;
                }
            }

            rect->move();
            glRectd(rect->getX1(), rect->getY1(), rect->getX2(), rect->getY2());
        }

        // On désactive le tableau Vertex Attrib puisque l'on n'en a plus besoin
        glDisableVertexAttribArray(0);

        // Actualisation de la fenêtre
        SDL_GL_SwapWindow(fenetre);
    }

    // On quitte la SDL
    SDL_GL_DeleteContext(contexteOpenGL);
    SDL_DestroyWindow(fenetre);
    SDL_Quit();
    return 0;
}
