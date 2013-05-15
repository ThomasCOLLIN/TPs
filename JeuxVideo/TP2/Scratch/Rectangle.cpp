#include "Rectangle.h"

Rectangle::Rectangle(double x1, double y1, double x2, double y2)
    : _x1(x1),
    _y1(y1),
    _x2(x2),
    _y2(y2)
{
}

Rectangle::~Rectangle()
{
}

double Rectangle::getX1()
{
    return _x1;
}

double Rectangle::getY1()
{
    return _y1;
}

double Rectangle::getX2()
{
    return _x2;
}

double Rectangle::getY2()
{
    return _y2;
}
