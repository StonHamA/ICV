% script written by Jingxiong Li 180770429
% this script is for coursework 4)
%% video input and initiallize
[frames, frameCount, videoHeight, videoWidth] = video2frames('NewDatasetC.avi');
%MBsz is MatchingBlock Size, SWsz is SearchWindow Size.
%SWsz - MBsz must be an even number
MBsz = 8;
SWsz = 32;
%input the frame number
detectFtrame = 25;
center = (SWsz - MBsz) / 2;

singleFrame1 = frames(detectFtrame).cdata;
singleFrame2 = frames(detectFtrame + 1).cdata;

% gray picrute convertion
singleFrameGrey1 = c2g(videoHeight, videoWidth, frames(detectFtrame).cdata); 
singleFrameGreyC = c2g(videoHeight, videoWidth, frames(detectFtrame + 1).cdata);
%Cut the frame into matching blocks
%matchingBlocks are in 'matchingblocks.data'
matchingBlock = frameCut(videoHeight, videoWidth, MBsz, singleFrameGrey1); 

%% blockmatch

% enlarge the picture pad to process all the pixels
singleFrameGrey2 = zeros(videoHeight + 2 * SWsz ,videoWidth + 2 * SWsz);
singleFrameGrey2(SWsz + 1 : videoHeight + SWsz , SWsz + 1: videoWidth + SWsz) = singleFrameGreyC;

a = 1; b = 1;
SWx = SWsz - (SWsz - MBsz) / 2;
SWy = SWsz - (SWsz - MBsz) / 2;

for i = 1 : MBsz :  videoHeight
    SWx =  i - (SWsz - MBsz) / 2 + SWsz;
    a = (i-1)/MBsz + 1;
    
    for j = 1 : MBsz : videoWidth
        SWy = j - (SWsz - MBsz) / 2 + SWsz;
        b = (j-1)/MBsz + 1;        
    
        [minMSE,MBx,MBy] = blockMatch(matchingBlock(a,b).data, SWx, SWy, SWsz, singleFrameGrey2);
        % mbXY stores the end point  of motion vectors
        matchingBlock(a, b).mbXY = [MBx, MBy];        
    end
end

%% draw motion vectors
figure(1);
drawVector(videoHeight, videoWidth, MBsz, SWsz, matchingBlock, singleFrame2);
title('motion vectors')
figure(2);
imshow(singleFrame1);
title('frame It')
figure(3);
imshow(singleFrame2);
title('frame It+1')

%% prediction
%fill the unfilled pixels, if not , set compensate to 0
compensate = 1;
reconstructFrame = reconstruct(videoHeight, videoWidth, MBsz, matchingBlock, compensate);
figure(4);
imshow(uint8(reconstructFrame));
title('frame Pt+1')

%% plot the execution time
figure(5);
t = [8.425, 2.532, 2.139];
bar(t);
title('different time for 16*16 search window')
xticklabels({'4*4', '8*8', '16*16'});
xlabel('matching block size')
ylabel('time')

figure(6);
t = [3.089, 3.475, 4.116];
bar(t);
title('different time for 8*8 matching block')
xticklabels({'8*8', '16*16', '32*32'});
xlabel('searching window size')
ylabel('time')
