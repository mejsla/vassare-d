module app;

import std.algorithm;
import std.array;
import std.stdio;

void dynamicArrays()
{
    int[] a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    a ~= 10;
    writeln(a);

    writeln(a[7 .. $]);

    const b = a.filter!(e => e % 2 == 0)
               .map!(e => e + 100)
               .array;
    writeln(b);

    writeln((immutable(char)[]).stringof);

    string s = "Hello, world";
    s ~= "!";
    writeln(s);
}

void associativeArrays()
{
    int[string] aa = ["one" : 1, "two" : 2, "three" : 3];
    aa["four"] = 4;
    writeln(aa);

    if (auto one = "one" in aa)
    {
        writeln("Found ", *one);
    }

    aa.byKey
      .array
      .sort
      .each!(k => writeln(k, "=", aa[k]));
}

void main()
{
    dynamicArrays();
    //associativeArrays();
}
