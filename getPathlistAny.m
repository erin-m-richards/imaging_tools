function pathlist = getPathlistAny(options)
% GETPATHLISTANY Allow user to pick files from a pop-up window. 
arguments
    options.fileID (1,1) string = "'*.xlsx;*.csv;*.txt', 'Data matrix files (*.xlsx,*.csv,*.txt)'; '*.*', 'All files (*.*)'"
    options.message (1,1) string = "Select file(s) for analysis."
    options.multiselect (1,1) string = "on"
end

[names, path] = uigetfile(options.fileID, options.message, ...
    'MultiSelect', options.multiselect);

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