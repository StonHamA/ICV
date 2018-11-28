%% run this block for question C)
% takes 3 minutes to run pixel2pixel background generation so please be
% patient
[frames, frameCount, videoHeight, videoWidth] = video2frames('NewDatasetC.avi');

%c2g all
for i = 1 : frameCount
    frameGrey(i).data = c2g(videoHeight, videoWidth, frames(i).cdata); 
end

threshold = 5;
frameDiff = diffFrame(videoHeight, videoWidth,frameCount,frameGrey, threshold, 0);
%fast process generates low quality background (takes 1 minutes less)
fast = 0;
backGround = backGroundGen(videoHeight, videoWidth, frameCount, frameDiff, frameGrey, fast);
imshow(uint8(backGround));

%% run this block for question d)
for i = 1 : frameCount
    frameDiff(i).objectData = abs(frameGrey(i).data - backGround);
end


    countingFrame = zeros();
    countingBlock = zeros(16);
    height = 18;
    width = 22;
        
    for j = 1 : videoHeight - 16
        for k = 1 : videoWidth - 16
            countingBlock = frameDiff(1).objectData(j : j +15, k : k +15);
            Gaussian = fspecial('gaussian', 16, 1.0);
            K = countingBlock .* Gaussian;
            d = sum(sum(K));
            if  sum(sum(K))>= 15
                countingFrame(j, k) = 1;
            else
                countingFrame(j, k) = 0;
            end
        end
    end
 %%   maybe use cluster?


    


