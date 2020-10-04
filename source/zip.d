module zip;

import std.conv;
import std.range;
import std.stdio;
import std.utf;

string zip(string a, string b) pure
in
{
    assert(a.count == b.count);
}
out(s)
{
    assert(s.count == a.count + b.count);
}
body
{
    string ra = a;
    string rb = b;
    string result;

    while (!ra.empty)
    {
        result ~= ra.front;
        result ~= rb.front;
        ra.popFront();
        rb.popFront();
    }

    return result;
}

unittest
{
    assert(zip("", "") == "");
    assert(zip("123", "abc") == "1a2b3c");
    assert(zip("räksmörgås", "----------") == "r-ä-k-s-m-ö-r-g-å-s-");
}
