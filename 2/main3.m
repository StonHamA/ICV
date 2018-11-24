%% video in 
[frames, frameCount, videoHeight, videoWidth] = video2frames('NewDatasetC.avi');
%SWsz - MBsz必须是偶数
MBsz = 16;
SWsz = 20;
detectFtrame = 47;
center = (SWsz - MBsz) / 2;

%% 抽出部分
singleFrame1 = frames(detectFtrame).cdata;
singleFrame2 = frames(detectFtrame + 1).cdata;
singleFrameGrey1 = c2g(videoHeight, videoWidth, frames(detectFtrame).cdata); 
singleFrameGreyC = c2g(videoHeight, videoWidth, frames(detectFtrame + 1).cdata);

%所有坐标都化成绝对坐标再进行存储
%定义Matchingblock, 将图片分成若干小块
matchingBlock = frameCut(videoHeight, videoWidth, MBsz, singleFrameGrey1); 

%% searching blockmatch
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
        matchingBlock(a, b).mbXY = [MBx, MBy];
        
%         %相对坐标还原 相对坐标+绝对坐标原点
%         realX = SWsz + 1+MBsz*(a-1)+(MBx-center);
%         realY = SWsz + 1+MBsz*(b-1)+(MBy-center);       
%         matchingBlock(a, b).realMBXY = [realX, realY]; %这个是绝对坐标
%         matchingBlock(a, b).MSE = minMSE;

    end
end

%% 以及画vector
figure(1);
drawVector(videoHeight, videoWidth, MBsz, SWsz, matchingBlock, singleFrame1);
figure(2);
subplot(1,2,1);
imshow(singleFrame2);

%% 预测动态重组图片
reconstructFrame = reconstruct(videoHeight, videoWidth, MBsz, matchingBlock);
subplot(1,2,2);
imshow(uint8(reconstructFrame));


