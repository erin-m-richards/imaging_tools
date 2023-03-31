function nucleusPos = txt2positions(txtFile)
% TXT2POSITIONS Convert .txt file to cell array of the positions listed in
% the .txt file.
%  
% INPUTS
% ------
% txtFile: .txt file that you want to read in
%   string

outlineFileName = fopen(txtFile);
line = fgetl(outlineFileName);
numNuclei = 1;

while ischar(line) % As long as the file gives characters...
    %Find rows with the nuclear position arrays.
    nucleusTitleRow = strfind(line, 'Nucleus_START');
    if length(nucleusTitleRow) == 1
        line = fgetl(outlineFileName); % Move down to X pos
        Xchar = line; % Get line
        nucleusX = strsplit(Xchar); % Split at spaces
        nucleusX = nucleusX(2:end-1); % Remove header
        line = fgetl(outlineFileName); % Move down to y pos
        Ychar = line;
        nucleusY = strsplit(Ychar);
        nucleusY = nucleusY(2:end-1);
        nucleusList = NaN(size(nucleusX,2), 2);
        for p = 1:size(nucleusX, 2) % Save as a list
            nucleusList(p,1) = str2double(nucleusX{p});
            nucleusList(p,2) = str2double(nucleusY{p});
        end
        nucleusPos{numNuclei, 1} = nucleusList;
        numNuclei = numNuclei + 1;
    end
    line = fgetl(outlineFileName); % Move down a line
end
fclose(outlineFileName);