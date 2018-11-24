[frames, frameCount, videoHeight, videoWidth] = video2frames('NewDatasetC.avi');
%%c2g all

for i = 1 : frameCount
    frameGrey(i).data = c2g(videoHeight, videoWidth, frames(i).cdata); 
end
% frameReference = frameGrey(1).data;
frameReference = frameGrey(i - 1).data;
for i = 2 : frameCount
    frameDiff(i).data = frameGrey(i).data - frameGrey(i - 1).data;;
end
for i = 2 : frameCount
    imshow(uint8(frameDiff(i).data));
end




