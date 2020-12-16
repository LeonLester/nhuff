function dsig = myhuffmandeco(comp,dict) % comp must be a numeric vector (row or col)
dsig = {}; % output array
[n1, n2] = size(comp); 
if n1 > n2
    n = n1;
else
    n = n2;
end
dictSize = size(dict,1); % dictSize will have the number of rows of dict
% this function iterates over the dict and checks each element if it has
% 
function symbol = getSymbol(code)
    symbol = NaN; % initialize as NaN
    for j = 1:dictSize
        tmpCode = cell2mat(dict(j,2)); % get the code of the j-th element in dict (the second column of the cell array)
        tmpCodeSize = size(tmpCode, 2); % get the length of the code of that element
        codeSize = size(code, 2); 
        if tmpCodeSize > codeSize % if the code you read in this iterationis not the same size as the input
        break;
        end
        if isequal(codeSize,tmpCodeSize) && isequal(tmpCode,code)
            symbol = cell2mat(dict(j,1));
            break;
        end
    end
end
% the following block will start with 1 digit and add 1 until the functions
% getSymbol recognizes the string of digits as an encoded element from dict
beginning = 1;
ending = 1;
while ending < n
    symbol = getSymbol(comp(beginning:ending));
    while isnan(symbol) % while the symbol has not been found
        ending = ending + 1;    % add one digit to the string to check
        symbol = getSymbol(comp(beginning:ending)); % call gtSymbol for the new (+1) string
    end
    dsig{size(dsig,2)+1} = symbol; % 
    if ending ~= n
        ending =ending+ 1;
        beginning = ending;
    end
end
% string(dsig) % uncomment this line or include it in your main to change
% the output to a single string
end