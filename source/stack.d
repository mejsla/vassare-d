module stack;

interface Stack(T)
{
    bool empty();

    void push(T item)
    out
    {
        assert(!empty());
        assert(top() == item);
    }

    T pop()
    in
    {
        assert(!empty());
    }

    T top()
    in
    {
        assert(!empty());
    }
}
