module concurrent;

import core.thread;
import std.algorithm;
import std.concurrency;
import std.random;
import std.stdio;

struct Exit
{
}

void worker(int id)
{
    bool isDone = false;

    while (!isDone) {
        receive(
            (int message) {
                stdout.writeln("Worker ", id, " received ", message);
                stdout.flush;
                Thread.sleep(1.seconds);
                ownerTid.send(message);
            },
            (Exit e) {
                stdout.writeln("Worker ", id, " exiting");
                stdout.flush;
                isDone = true;
            }
        );
    }
}

void spawnWorkers()
{
    auto workers = [0, 1, 2].map!(id => spawn(&worker, id));

    workers.each!(worker => worker.send(uniform(0, 100)));

    foreach (i; 0..3)
    {
        const result = receiveOnly!int();
        stdout.writeln("Owner received result ", result);
        stdout.flush;
    }

    workers.each!(worker => worker.send(Exit()));
}
