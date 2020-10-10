module korvkylen;

import korv;

public class Korvkylen
{
    private Korv[] korvar;

    public this()
    {
        korvar = [
            new Korv(1, "Bullens pilsnerkorv", "odefinierbar", 3),
            new Korv(2, "Falukorv", "menlös", 2),
            new Korv(3, "Fiskkorv", "smakar inte ens kött", -1),
            new Korv(4, "Vegankov", "underbar", 100)
        ];
    }

    public Korv[] korvarna() @safe
    {
        return korvar.dup;
    }
}
