#ifndef MOVINGRECTANGLE_H
#define MOVINGRECTANGLE_H

#include "Rectangle.h"


class MovingRectangle : public Rectangle
{
    public:
        MovingRectangle(double x1, double y1, double x2, double y2);
        virtual ~MovingRectangle();
        void setDirectionX(double x);
        double getDirectionX();
        void setDirectionY(double y);
        double getDirectionY();
        void setSpeed(double speed);
        double getSpeed();
        void setOrientation(int angle);
        int getOrientation();
        void move();
    protected:
    private:
        double _directionX;
        double _directionY;
        double _speed;
        int _orientation;
};

#endif // MOVINGRECTANGLE_H
