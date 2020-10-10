module korv;

import std.conv;

public class Korv
{
    int id;
    string namn;
    string smak;
    int styrka;

    public this(int id, string namn, string smak, int styrka)
    {
        this.id = id;
        this.namn = namn;
        this.smak = smak;
        this.styrka = styrka;
    }

    public int getId() @safe
    {
        return id;
    }

    public string getNamn() @safe
    {
        return namn;
    }

    public string getSmak() @safe
    {
        return smak;
    }

    public int getStyrka() @safe
    {
        return styrka;
    }

    public override string toString() const
    {
        return namn;
    }
}

public class Korvar
{
    Korv[] korvar;

    public this(Korv[] korvar) @safe
    {
        this.korvar = korvar.dup;
    }

    public Korv[] getKorvar() @safe
    {
        return korvar;
    }

    override public string toString() const
    {
        return "Korvar(korvar=" ~ to!string(korvar) ~ ')';
    }
}
