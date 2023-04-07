function idx = txt2rowIdx(txtFile, header, footer)
% TXT2rowIdx Convert .txt file to cell array of the rows bookended
% by the header and the footer listed in the .txt file.
%  
% INPUTS
% ------
% txtFile: .txt file that you want to read in
%   string
% header: text that indicates the start of the information to be indexed
%   string
% footer: text that indicates the end of the information to be indexed
%   string

cellArray = txt2cell(txtFile); % read as a cell array first
idxStart = find(strcmp(cellArray, header)); % find header rows
idxEnd = find(strcmp(cellArray, footer)); % find footer rows

% Find rows in .txt file in between header and footer rows.
if length(idxStart) > 1
    firstStart = num2str(idxStart(1) + 1); % include the header variables but not the header
    firstEnd = num2str(idxEnd(1) - 1); % stop one short of the footer
    secondStart = num2str(idxStart(2) + 1);
    secondEnd = num2str(idxEnd(2) - 1);
    idx(1,1) = cellstr(strcat(firstStart, ":", firstEnd));
    idx(2,1) = cellstr(strcat(secondStart, ":", secondEnd)); 
else
    firstStart = num2str(idxStart(1) + 1);
    firstEnd = num2str(idxEnd(1) - 1); 
    idx(1,1) = cellstr(strcat(firstStart, ":", firstEnd));
end
end