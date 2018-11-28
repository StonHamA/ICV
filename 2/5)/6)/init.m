function [frameGrey, videoHeight, videoWidth] = init();
    frames(1).data = zeros(288, 352);
    frames(2).data = zeros(288, 352);
    frames(3).data = zeros(288, 352);
    frames(4).data = zeros(288, 352);
    frames(5).data = zeros(288, 352);
    frames(6).data = zeros(288, 352);
    %c2g all
    frames(1).data = imread('car-1.jpg');
    frames(2).data = imread('car-2.jpg');
    frames(3).data = imread('car-3.jpg');
    frames(4).data = imread('face-1.jpg');
    frames(5).data = imread('face-2.jpg');
    frames(6).data = imread('face-3.jpg');
    [videoHeight, videoWidth,~] = size(frames(1).data);

    frameGrey(1).data = c2g(videoHeight, videoWidth, frames(1).data); 
    frameGrey(2).data = c2g(videoHeight, videoWidth, frames(2).data);
    frameGrey(3).data = c2g(videoHeight, videoWidth, frames(3).data);
    frameGrey(4).data = c2g(videoHeight, videoWidth, frames(4).data);
    frameGrey(5).data = c2g(videoHeight, videoWidth, frames(5).data);
    frameGrey(6).data = c2g(videoHeight, videoWidth, frames(6).data);
end