function matchingBlock = frameCut(videoHeight, videoWidth, MBsz, singleFrameGrey1)

for i = 1 : MBsz :  videoHeight
    a = (i-1)/MBsz + 1;    
    for j = 1 : MBsz : videoWidth
        b = (j-1)/MBsz + 1;           
        
        %防止下标越界*(最后面哪一点)
        if (i + MBsz - 1 > videoHeight) || (j + MBsz - 1 > videoWidth) 
            matchingBlock(a, b).data = [singleFrameGrey1(i : videoHeight, j : videoWidth)];
        else
            matchingBlock(a, b).data = [singleFrameGrey1(i : i + MBsz - 1, j : j + MBsz - 1)];
        end
            matchingBlock(a, b).XY = [i,  j];
            
    end
end