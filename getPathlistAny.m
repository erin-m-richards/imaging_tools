function pathlist = getPathlistAny(fileIDdefault, options)
% GETPATHLISTANY Allow user to pick files from a pop-up window. 
arguments
    fileIDdefault (1,1) logical
    options.fileID (1,1) cell = {'*.*'}
    options.message (1,1) string = "Select file(s) for analysis."
    options.multiselect (1,1) string = "on"
end

switch fileIDdefault
    case true
        [names, path] = uigetfile('', options.message, ...
    'MultiSelect', options.multiselect);
    case false
        [names, path] = uigetfile(options.fileID, options.message, ...
    'MultiSelect', options.multiselect);
end

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