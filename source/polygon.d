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

alias Triangle = Polygon!3;

void foo(Triangle triangle)
{
    foreach (point; triangle.corners)
    {
        writeln(point);
        point.x = 0;
    }
}

unittest
{
    assert(Triangle().corners.length == 3);

    auto triangle = Triangle([Point(1, 2), Point(3, 4), Point(5, 6)]);
    foo(triangle);
    writeln(triangle);
}
