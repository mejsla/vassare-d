module bar;

import std.stdio;
import std.string;

/++
    Params:
        s = A string.

    Returns: The string converted to upper case.

    $(RED Important Note:) Some important information.
+/
string bar(string s)
{
    return s.toUpper;
}

///
unittest
{
    // Calling `bar` on an empty string returns an empty string
    assert("".bar == "");

    // Calling `bar` on some string converts it to upper case
    assert("hello".bar == "HELLO");
}