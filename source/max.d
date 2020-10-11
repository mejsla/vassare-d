module max;

T max(T)(T a, T b)
{
    if (a > b)
    {
        return a;
    }
    else
    {
        return b;
    }
}

struct Foo
{
    int value;

    /*
    int opCmp()(auto ref const Foo rhs) const
    {
        if (value < rhs.value)
        {
            return -1;
        }
        else if (value > rhs.value)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }
    */
}

unittest
{
    assert(max!(int)(7, 3) == 7);

    assert(max!int(7, 3) == 7);

    assert(max(7, 3) == 7);

    assert(max(3.4, 0.7) == 3.4);

    assert(max("abc", "cde") == "cde");

    //assert(max(Foo(1), Foo(2)) == Foo(2));
}