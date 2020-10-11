module meta;

import std.conv;

ulong fac(int n)()
{
    return n * fac!(n - 1)();
}

ulong fac(int n : 0)()
{
    return 1;
}

unittest
{
    enum f5 = fac!5();
    pragma(msg, "fac(5)=" ~ to!string(f5));
    assert(f5 == 120);
}