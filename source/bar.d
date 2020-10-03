module bar;

import foo;
import std.stdio;

class Bar : Foo
{
    this(string s)
    {
        super(s);
    }

    override void append(char c)
    {
        writeln("appending: ", c);
        buf_ ~= c;
        len_++;
    }

    override char removeFirst()
    in
    {
        assert(len_ > 0);
    }
    body
    {
        const char c = buf_[0];
        buf_ = buf_[1..$];
        --len_;
        writeln("removing: ", c);
        return c;
    }
}

unittest
{
    auto bar = new Bar("bar");
    bar.append('k');
    assert(bar.buf == "bark");

    bar.removeFirst();
    assert(bar.buf == "ark");

    /*
    bar = new Bar("");
    bar.removeFirst();
    */
}