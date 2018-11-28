% function written by Jingxiong Li 180770429
% this function is used to figure out coursework 4),
% cut frames according to the size of matching block(MBsz)
function matchingBlock = frameCut(videoHeight, videoWidth, MBsz, singleFrame)

for i = 1 : MBsz :  videoHeight
    a = (i-1)/MBsz + 1;    
    for j = 1 : MBsz : videoWidth
        b = (j-1)/MBsz + 1;           
        

        if (i + MBsz - 1 > videoHeight) || (j + MBsz - 1 > videoWidth) 
            matchingBlock(a, b).data = [singleFrame(i : videoHeight, j : videoWidth)];
        else
            matchingBlock(a, b).data = [singleFrame(i : i + MBsz - 1, j : j + MBsz - 1)];
        end
            matchingBlock(a, b).XY = [i,  j];
            
    end
end