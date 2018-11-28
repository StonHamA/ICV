function gray = c2g(videoHeight, videoWidth, frame)
frame = double(frame);
gray = zeros(videoHeight, videoWidth);
gray(:, :) = uint8((frame(:, :, 1) * 299 + frame(:, :, 2) * 587 + frame(:, :, 3) * 114) / 1000);

end