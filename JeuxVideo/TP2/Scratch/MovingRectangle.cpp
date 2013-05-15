#include "MovingRectangle.h"

MovingRectangle::MovingRectangle(double x1, double y1, double x2, double y2)
    : Rectangle(x1, y1, x2, y2),
    _directionX(0.0),
    _directionY(0.0),
    _speed(0.0),
    _orientation(0)
{
    //ctor
}

MovingRectangle::~MovingRectangle()
{
    //dtor
}

void MovingRectangle::setSpeed(double speed)
{
    _speed = speed;
}

double MovingRectangle::getSpeed()
{
    return _speed;
}

void MovingRectangle::setDirectionX(double x)
{
    _directionX = x;
}

double MovingRectangle::getDirectionX()
{
    return _directionX;
}

void MovingRectangle::setDirectionY(double y)
{
    _directionY = y;
}

double MovingRectangle::getDirectionY()
{
    return _directionY;
}

void MovingRectangle::setOrientation(int angle)
{
    _orientation = angle;
}

int MovingRectangle::getOrientation()
{
    return _orientation;
}

void MovingRectangle::move()
{
    _x1 += _speed * _directionX;
    _x2 += _speed * _directionX;
    _y1 += _speed * _directionY;
    _y2 += _speed * _directionY;
}
