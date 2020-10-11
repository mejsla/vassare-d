module polygon;

import std.algorithm;
import std.stdio;

struct Point
{ 
    int x;
    int y;
} 

struct Polygon(int n)
{
    Point[n] corners;
}

unittest
{
    alias Triangle = Polygon!3;
    alias Rectangle = Polygon!4;

    assert(Triangle().corners.length == 3);
    assert(Rectangle().corners.length == 4);
}