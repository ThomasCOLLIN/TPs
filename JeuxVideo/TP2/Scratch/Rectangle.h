#ifndef RECTANGLE_H
#define RECTANGLE_H


class Rectangle
{
    public:
        Rectangle(double x1, double y1, double x2, double y2);
        virtual ~Rectangle();
        double getX1();
        double getY1();
        double getX2();
        double getY2();
    protected:
        double _x1;
        double _y1;
        double _x2;
        double _y2;
    private:
};

#endif // RECTANGLE_H
