module foo;

import dshould;
import dunit;
import std.stdio;
import std.string;

string foo(string s)
{
    return s.toUpper;
}

class FooTest
{
    mixin UnitTest;

    @BeforeEach public void setUp()
    {
    }

    @Test public void shouldHandleEmptyString()
    {
        assertEquals("", foo(""));
    }

    @Test public void shouldConvertStringToUpper()
    {
        "hello".foo.should.equal("HELLo");
        "world!".foo.should.equal("WORLD!");
    }
}

version(unittest)
{
    mixin Main;
}
