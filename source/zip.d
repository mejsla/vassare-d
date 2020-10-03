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
    auto da = to!dstring(a);
    auto db = to!dstring(b);

    dstring result;

    while (!da.empty)
    {
        result ~= da[0];
        result ~= db[0];
        da = da[1 .. $];
        db = db[1 .. $];
    }

    return to!string(result);
}

unittest
{
    assert(zip("", "") == "");
    assert(zip("123", "abc") == "1a2b3c");
    assert(zip("räksmörgås", "----------") == "r-ä-k-s-m-ö-r-g-å-s-");
}
