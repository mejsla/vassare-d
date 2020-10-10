module compiler;

import pegged.grammar;
import std.algorithm;
import std.array;
import std.conv;

// ---------------------------------------------------------------------------
// AST
// ---------------------------------------------------------------------------

interface Node
{
    string toCode() const pure;
}

class Module : Node
{
    Line[] lines_;

    this(Line[] lines)
    {
        lines_ = lines;
    }

    override string toCode() const pure
    {
        const code = lines_
            .map!(line => line.toCode)
            .joiner
            .to!string;
        return "import std.stdio;\n\nvoid main()\n{\n" ~ code ~ "}\n";
    }
}

class Line : Node
{
    Print print_;

    this(Print print)
    {
        print_ = print;
    }

    override string toCode() const pure
    {
        return print_.toCode;
    }
}

class Print : Node
{
    int value_;

    this(int value)
    {
        value_ = value;
    }

    override string toCode() const pure
    {
        return "writeln(" ~ to!string(value_) ~ ");\n";
    }
}

// ---------------------------------------------------------------------------
// Lexer
// ---------------------------------------------------------------------------

mixin(grammar(`
              BASIC:
              Module    < Line* eoi
              Line      < "PRINT"i Integer
              Integer   < ~([0-9]+)
              `));

// ---------------------------------------------------------------------------
// Parser
// ---------------------------------------------------------------------------

Module parse(ParseTree pt)
{
    return parseModule(pt.children[0]);
}

Module parseModule(ParseTree pt)
{
    return new Module(pt.children.map!(line => parseLine(line)).array);
}

Line parseLine(ParseTree pt)
{
    return new Line(parsePrint(pt));
}

Print parsePrint(ParseTree pt)
{
    return new Print(parseInt(pt.children[0]));
}

int parseInt(ParseTree pt)
{
    return to!int(pt.matches[0]);
}

// ---------------------------------------------------------------------------
// Compiler
// ---------------------------------------------------------------------------

string compile(string filename)()
{
    enum basicCode = import(filename);
    pragma(msg, "Basic code\n----------\n" ~ basicCode);

    enum pt = BASIC(basicCode);
    pragma(msg, "Parse tree\n----------\n" ~ pt.toString);

    enum dCode = pt.parse.toCode;
    pragma(msg, "D code\n------\n" ~ dCode);

    return dCode;
}
