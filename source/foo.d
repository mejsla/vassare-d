module foo;

import std.algorithm;

class Foo
{
    string buf_;
    size_t len_;

    this(string s)
    {
        buf_ = s;
        len_ = s.length;
    }

    invariant
    {
        assert(len_ == buf_.length);
    }

    void append(char c)
    out
    {
        assert(buf_.endsWith(c));
    }
    body
    {
        buf_ ~= c;
        len_++;
    }

    char removeFirst()
    in
    {
        assert(len_ > 0);
    }
    body
    {
        const char c = buf_[0];
        buf_ = buf_[1..$];
        --len_;
        return c;
    }

    size_t len() const pure
    {
        return len_;
    }

    string buf() const pure
    {
        return buf_;
    }
}

unittest
{
    auto foo = new Foo("");
    foo.append('a');
    assert(foo.buf == "a");
    foo.removeFirst();
    assert(foo.buf == "");
}