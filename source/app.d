module app;

import std.stdio;
import std.utf;
import zip : zip;

void main()
{
    writeln("räksmörgås".length, " != ", "räksmörgås".count);

    writeln(zip("123", "abc"));
}
