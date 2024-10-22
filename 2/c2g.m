% function written by Jingxiong Li 180770429
% this function is used to figure out coursework 4),
%convert colour picture to black and white.
function gray = c2g(videoHeight, videoWidth, frame)
frame = double(frame);
gray = zeros(videoHeight, videoWidth);
gray(:, :) = uint8((frame(:, :, 1) * 299 + frame(:, :, 2) * 587 + frame(:, :, 3) * 114) / 1000);

end