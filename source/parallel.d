module parallel;

import core.thread;
import std.datetime.stopwatch;
import std.parallelism;
import std.stdio;

struct Car
{
    int id;

    void drive() const
    {
        writeln("Starting car ", id);
        stdout.flush;
        Thread.sleep(1.seconds);
        writeln("Stopping car ", id);
    }
}

void driveCars()
{
    const Car[] cars = [Car(1), Car(2), Car(3), Car(4)];

    auto sw = StopWatch(AutoStart.no);

    sw.start();
    foreach (car; cars)
    {
        car.drive();
    }
    sw.stop();

    writeln("Execution time: ", sw.peek.total!"msecs", "ms");
}
