function drawVector(videoHeight, videoWidth, MBsz,SWsz, matchingBlock, singleFrame1)


for i = 1 : MBsz :  videoHeight
    SWx =  i - (SWsz - MBsz) / 2 + SWsz;
    a = (i-1)/MBsz + 1;
    for j = 1 : MBsz : videoWidth
        SWy = j - (SWsz - MBsz) / 2 + SWsz;
        b = (j-1)/MBsz + 1;

        pointX(a, b) = [matchingBlock(a, b).mbXY(1) - SWsz - MBsz -1];
        pointY(a, b) = [matchingBlock(a, b).mbXY(2) - SWsz - MBsz -1];
        
    end
end
        imagesc([1 videoWidth], [1 videoHeight], singleFrame1);
        hold on;
        xticks([1 : MBsz : MBsz*b]);
        yticks([1 : MBsz : MBsz*a]);
        grid on;        
        quiver(9 : MBsz : MBsz*b+8, 9 : MBsz : MBsz*a + 8, pointY, pointX);
end 