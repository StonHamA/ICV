%% video in 
[frames, frameCount, videoHeight, videoWidth] = video2frames('DatasetB.avi');
%% Block match
frame = rgb2gray(frames(1).cdata); 
%定义inputblock的类型
inputBlock = ones(16,16);
%找出了最匹配的位置（vecXY指matchingBlock矩阵1，1位）以及方差
[Val,vecX,vecY] = blockMatch(inputBlock, 1, 1, 20, frame);
