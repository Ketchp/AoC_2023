fd = fopen('input01.txt');

res = 0.0;
while ~feof(fd)
    currentLine = fgetl(fd);
    currentLine = strrep(currentLine, 'one', 'one1one');
    currentLine = strrep(currentLine, 'two', 'two2tow');
    currentLine = strrep(currentLine, 'three', 'three3three');
    currentLine = strrep(currentLine, 'four', 'four4four');
    currentLine = strrep(currentLine, 'five', 'five5five');
    currentLine = strrep(currentLine, 'six', 'six6six');
    currentLine = strrep(currentLine, 'seven', 'seven7seven');
    currentLine = strrep(currentLine, 'eight', 'eight8eight');
    currentLine = strrep(currentLine, 'nine', 'nine9nine');

    first = true;
    lastDigit = 0;
    for i = 1:length(currentLine)
        currentChar = currentLine(i);
        if contains('0123456789', currentChar)
            num = str2double(string(currentChar));
            lastDigit = num;
            if first
                res = res + 10 * lastDigit;
                first = false;
            end
        end
    end
    res = res + lastDigit;
end

fprintf("%f\n", res);
