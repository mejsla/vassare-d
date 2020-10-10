module controller;

import korv;
import korvkylen;
import vibe.vibe;
import std.algorithm;
import std.exception;
import std.stdio;

interface KorvService
{
    @path("/korvar")
    Korvar getKorv() @safe;

    @path("/korvar/:id")
    Korv getEnKorv(int _id) @safe;
}

class KorvController : KorvService
{
    private Korvkylen korvkylen;

    this(Korvkylen korvkylen)
    {
        this.korvkylen = korvkylen;
    }

    Korvar getKorv() @safe
    {
        return new Korvar(korvkylen.korvarna());
    }

    Korv getEnKorv(int _id) @safe
    {
        auto korvskivan = korvkylen.korvarna().find!(korv => korv.getId() == _id);
        if (!korvskivan.empty)
        {
            return korvskivan[0];
        }
        else
        {
            throw new HTTPStatusException(404, "Ingen korv finns med id=%s, 😞".format(_id));
        }
    }

    unittest
    {
        auto controller = new KorvController(new Korvkylen);

        assert(controller.getEnKorv(1).getNamn() == "Bullens pilsnerkorv");

        assertThrown(controller.getEnKorv(7));
    }
}
