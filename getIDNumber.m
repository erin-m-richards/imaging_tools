function [IDnames, IDpaths] = getIDNumber(main_files, id_files, id_file_type, delimiter)
    
for f = 1:length(main_files)
    c = 1;
    
    for i = 1:length(id_files)
        id_file_name = split(id_files{i}, [delimiter, id_file_type]);
        id_name = id_file_name(end-1, 1);
        id_file_name = id_file_name(1:end-2, 1);
    
        if strfind(main_files{f}, id_file_name) == 1
            IDnames{c,f} = id_name;
            IDpaths{c,f} = id_files{i};
            c = c + 1;
        end
    end
    
end

end
