% function written by Jingxiong Li 180770429
% this function is used to figure out coursework 5),
% this function performs a pixel-by- pixel frame differencing using a
% reference frame and a threshold. it retures to differencial values
function frameDiff = diffFrame(videoHeight, videoWidth,frameCount,frameGrey, threshold, questionA)
    if questionA
        frameReference = frameGrey(1).data;
        for i = 2 : frameCount
            frameDiff(i).data = frameGrey(i).data - frameReference;
        end
    else
        for i = 2 : frameCount
            frameDiff(i).data = frameGrey(i).data - frameGrey(i - 1).data;
        end        
    end
    
    frameDiff =  binaryDiff(videoHeight, videoWidth, frameCount, frameDiff, threshold);
    
end