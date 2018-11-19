
function [frames, frameCount, videoHeight, videoWidth] = video2frames(videoIn)
    videoIn = VideoReader(videoIn);
    videoHeight = videoIn.Height;
    videoWidth = videoIn.Width; 

    frames = struct('cdata', zeros(videoHeight, videoWidth, 3,'uint8'), 'colormap', []);
    frameCount = 1;
    while hasFrame(videoIn)
        frames(frameCount).cdata = readFrame(videoIn);
        frameCount = frameCount + 1;
    end

    frameCount = frameCount -1;
    
end