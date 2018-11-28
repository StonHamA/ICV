% function written by Jingxiong Li 180770429
% this function is used to figure out coursework 5)a),5)b)
[frames, frameCount, videoHeight, videoWidth] = video2frames('NewDatasetC.avi');

%colour to gray
for i = 1 : frameCount
    frameGrey(i).data = c2g(videoHeight, videoWidth, frames(i).cdata); 
end

% if you want question b), set 'questionA' to 0
%if you want 
questionA = 1;
threshold = 40;
frameDiff = diffFrame(videoHeight, videoWidth,frameCount,frameGrey, threshold, questionA);

%% plot selected frame
% framDiff(1) is null, because 1 cannont be differenced with 0
prompt = [' Which frame whould you like to check?(range from 2 ~', int2str(frameCount),')\n'];
i = input(prompt);


subplot(1,2,1);
if questionA
    imshow(uint8(frameGrey(1).data));
    title('Reference frame')
else
    imshow(uint8(frameGrey(i).data));
    title('Reference frame')
end
subplot(1,2,2);
imshow(uint8(frameGrey(i).data));
title('Selected frame')

figure(2);
imshow(uint8(frameDiff(i).binData));
title('differeced frame')




