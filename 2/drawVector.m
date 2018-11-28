% function written by Jingxiong Li 180770429
% this function is used to figure out coursework 4),
% draw vectors according to the result of block matching.
% MBsz--motion block size, SWsz-- search window size
function drawVector(videoHeight, videoWidth, MBsz,SWsz, matchingBlock, singleFrame1)
[x, y] = size(matchingBlock);
pointX = zeros(x, y);
pointY = zeros(x, y);

for i = 1 : MBsz :  videoHeight
    SWx =  i - (SWsz - MBsz) / 2 + SWsz;
    a = (i-1)/MBsz + 1;
    for j = 1 : MBsz : videoWidth
        SWy = j - (SWsz - MBsz) / 2 + SWsz;
        b = (j-1)/MBsz + 1;

        pointX(a, b) = matchingBlock(a, b).mbXY(1, 1) - (SWsz - MBsz +2)/2;
        pointY(a, b) = matchingBlock(a, b).mbXY(1, 2) - (SWsz - MBsz +2)/2;
        
    end
end
        imagesc([1 videoWidth], [1 videoHeight], singleFrame1);
        hold on;
        xticks([1 : MBsz : MBsz*b]);
        yticks([1 : MBsz : MBsz*a]);
        grid on;        
        quiver(1 + (MBsz/2) : MBsz : MBsz*b+MBsz/2, 1 + MBsz/2 : MBsz : MBsz*a + MBsz/2, pointY, pointX);
end 