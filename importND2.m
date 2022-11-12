% Imports ND2 files with the bioformat reader.
% returns a 5-D array: [x, y, z, c, t]
function stack = importND2(path)
bf = MicroscopeData.Original.BioFormats.bfopen(path);
meta_string = bf{1,1}{1,2};
meta_string = strsplit(meta_string);
%meta_string format = main folder, file, (maybe file name continued), xy image,
%total number of images (planes * channels * time), number of channels, number of time points

% Find number of z planes, channels, and time frames in file.
idx_z = strfind(meta_string, 'Z=');
idx_ch = strfind(meta_string, 'C=');
idx_t = strfind(meta_string, 'T='); % might not be the right string for time frames
cell_z = 0;
cell_ch = 0;
cell_t = 0;
for i = 1:numel(meta_string)
    if idx_z{i} == 1
        cell_z = i;
    elseif idx_ch{i} == 1
        cell_ch = i;
    elseif idx_t{i} == 1
        cell_t = t;
    end
end
if cell_z == 0
    num_z = 1;
else
    num_z = str2double(meta_string{cell_z}(5));
end
if cell_ch == 0
    num_ch = 1;
else
    num_ch = str2double(meta_string{cell_ch}(5));
end
if cell_t == 0
    num_t = 1;
else
    num_t = str2double(meta_string{cell_t}(5));
end

% Find number of x and y pixels in file.
y_aspect = size(bf{1,1}{1},1);
x_aspect = size(bf{1,1}{1},2);

as_mat = cell2mat(bf{1,1}(:,1));

stack = reshape(as_mat.', [x_aspect, y_aspect, num_ch, num_z, num_t]);
stack = permute(stack, [2, 1, 4, 3, 5]);
stack = cast(stack, 'single');
end