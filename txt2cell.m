function cellArray = txt2cell(txtFile)
% TXT2CELL Convert .txt file to cell array
%  
% INPUTS
% ------
% txtFile: .txt file that you want to read in
%   string

fid = fopen(txtFile);
tline = fgetl(fid);
l = 1;

while ischar(tline) % As long as the file gives characters...
    cellArray{l, 1} = tline; % Save line by line
    tline = fgetl(fid); % Move down a line
    l = l+1; % Move down a row in cellArray
end
fclose(fid);