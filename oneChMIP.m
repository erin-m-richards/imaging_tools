function mip = oneChMIP(raw, markerCh)
for t = 1:size(raw, 5)
    mip(:,:,:,1,t) = max(raw(:,:,:,markerCh,t), [], 3);
end
 