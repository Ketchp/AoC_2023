fd = fopen('input01.txt');

res = 0.0;
while ~feof(fd)
    currentLine = fgetl(fd);

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
