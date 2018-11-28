% function written by Jingxiong Li 180770429
% this function is used to figure out coursework 4),
% it is used to searching a block which has the smallest MSE in 
% the searching window then return tho the location of the block. 
%SWx, SWy is the laocation of searching window (which represented by it's (1,1) pixel in frame)

function [minMSE, MBx, MBy] = blockMatch(matchingBlock,SWx, SWy, windowSize, frame)
    frame = double(frame);
    matchingBlock = double(matchingBlock);
    [b, ~] = size(matchingBlock); 
    w = windowSize;   
    MSE = zeros((w - b+1), (w - b+1));

    % get searching window data
    searchingWindow = frame(SWx : (SWx + windowSize - 1), SWy : (SWy + windowSize - 1));
    % searching...
    for i = 1 : (w - b+1)
        for j = 1 : (w - b+1)
            tempMatchingBlock = searchingWindow(i : i+b-1, j : j+b-1);
            tempMSE = (tempMatchingBlock - matchingBlock) .^ 2;
            MSE(i, j) = sum(sum(tempMSE));
        end
    end
    minMSE = min(min(MSE));
    %find smallest MSE location , stored in MBx, MBy
     [MBx, MBy]=find(MSE==min(min(MSE)));
end
            