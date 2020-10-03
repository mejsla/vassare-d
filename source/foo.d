module foo;

import std.stdio;
import std.string;

string foo(string s)
{
    return s.toUpper;
}

unittest
{
    assert(foo("hello") == "HELLo");
    assert(foo("world") == "WORLD");
}
