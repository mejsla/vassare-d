import vibe.vibe;

import controller;
import korvkylen;

shared static this()
{
    auto router = new URLRouter;
    router.registerRestInterface(new KorvController(new Korvkylen));

    auto settings = new HTTPServerSettings;
    settings.port = 8081;
    settings.bindAddresses = ["::1", "127.0.0.1"];
    listenHTTP(settings, router);
}
