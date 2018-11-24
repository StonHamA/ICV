% 是分黑白还是彩色呢？
% （先假定黑白）
% 返回的是位置和MSE
% 只需要计算两帧之间的联系就行了, 其他的先不管
%inputBlock 需要一个位置信息--SWx和SWy--是searchblock的（1，1）; frame 是待检测帧
function [minMSE, MBx, MBy] = blockMatch(matchingBlock,SWx, SWy, windowSize, frame)
    % 先写这个要求的block マッチング， 先在帧中找到相应的block
    % 使用MSE
    frame = double(frame);
    matchingBlock = double(matchingBlock);
    [b, ~] = size(matchingBlock); 
    w = windowSize;
    
    MSE = zeros((w - b+1), (w - b+1));

%     [matchingBlock, matchingWindow] = blockSWsize(b, w);
    % 先把searchingWindow给抽出来 
    searchingWindow = frame(SWx : (SWx + windowSize - 1), SWy : (SWy + windowSize - 1));
    % 再把block 从searchingWindow给抽出来
    for i = 1 : (w - b+1)
        for j = 1 : (w - b+1)
            tempMatchingBlock = searchingWindow(i : i+b-1, j : j+b-1);
            tempMSE = (tempMatchingBlock - matchingBlock) .^ 2;
            MSE(i, j) = sum(sum(tempMSE));
        end
    end
    minMSE = min(min(MSE));
     [MBx, MBy]=find(MSE==min(min(MSE)));
end
            