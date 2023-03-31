function pathlist = getPathlistAny()
% GETPATHLISTANY Allow user to pick files from a pop-up window. 
[names, path] = uigetfile(...
    {'*.xlsx;*.csv;*.txt', 'Data matrix files (*.xlsx,*.csv,*.txt)';
    '*.*', 'All files (*.*)'}, ...
    'Select file(s) for analysis.', ...
    'MultiSelect', 'on');
pathlist = {};
if length(names) > 1
    if class(names) == 'char'
        fullName = strcat(path,names);
        pathlist{1,1} = fullName;
    else
        for n=1:length(names)
            fullName = strcat(path,names{n});
            pathlist{n,1} = fullName;
        end
    end
end