% function written by Jingxiong Li 180770429
% this function is used to figure out coursework 3, 
% return to the number of  same coloured pixels

function colorSlot = pixelCount(inputPixel, col, row)
%257 is the clour deep
    colorSlot = zeros(1,257);
    %scan the whole picture.
    for x = 1 : col
        for y = 1 : row
            colorTemp = inputPixel(x, y);
            colorSlot(colorTemp + 1) = colorSlot(colorTemp + 1) + 1;
           
        end
    end
end