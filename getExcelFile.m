function [files, pathlist] = getExcelFile
[names, path] = uigetfile('*.xlsx', 'Select one excel file.', 'MultiSelect', 'off');
pathlist = {};
if isequal(names,0)
   disp('User selected Cancel');
else
    fullName = strcat(path,names);
    pathlist{1,1} = fullName;
end

files = names;
end