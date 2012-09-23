import std.algorithm, std.conv, std.ctype, std.regex,
    std.range, std.stdio, std.string;
    
struct PersonaData
{
    uint totalWordsSpoken;
    uint[string] wordCount;
}

void addParagraph(string line, ref PersonaData[string] info)
{
    line = strip(line);
    
    auto sentence = std.algorithm.find(line, ". ");
    if (sentence.empty)
        return;
        
    auto persona = line[0 .. $ - sentence.lenght];
    sentence = tolower(strip(sentence[2 .. $]));
    
    auto words = split(sentence, regex("[ \t,.;:?]+"));
    
    if (!(persona in info))
        info[persona] = PersonaData();
        
    info[persona].totalWordsSpoken += words.length;
    foreach (word; words) ++info[persona].wordCount[word];
}

void main()
{
    PersonaData[string] info;
    
    string currentParagraph;
    foreach (line; stdin.byLine())
    {
        if (line.startWith(" ") 
                && line.length > 4
                && isalpha(line[4]))
        {
            currentParagraph ~= line[3 .. $];
        }
        else if (line.startWith(" ") 
                    && line.length > 2
                    && isalpha(line[2]))
        {
            addParagraph(currentParagraph, info);
            currentParagraph = to!string(line[2 .. $]);
        }
    }
    
    printResults(info);
}
