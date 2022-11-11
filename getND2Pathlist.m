function pathlist = getND2Pathlist
[names, path] = uigetfile('*.nd2', 'Select some nd2 files.', 'MultiSelect', 'on');
pathlist = {};
if isequal(names,0)
   disp('User selected Cancel');
else
    if size(names) > 1
        for n=1:length(names)
        pathlist{n} = strcat(path,names{n});
        end
    else
        pathlist{1} = strcat(path, names);
    end
end
end