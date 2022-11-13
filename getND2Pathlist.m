function [names, pathlist] = getND2Pathlist
[names, path] = uigetfile('*.nd2', 'Select some nd2 files.', 'MultiSelect', 'on');
pathlist = {};
if isequal(names,0)
   disp('User selected Cancel');
else
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
if size(pathlist, 1) > 1
    names = names';
end
end