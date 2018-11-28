% function written by Jingxiong Li 180770429
% this function is used to return to histo value
% and draw histograms.

function Histo = myHisto(imageIn, plot_on)

    % read image& get parameters
    if isstring(imageIn)
        inputImage =imread(imageIn) ; 
    else
         inputImage = imageIn;
    end
        
    [col, row, ~] = size(inputImage); 

    % Seperate different pixels
    Pixel = inputImage(:, :);


    % count and distinguish
    %'pixelCount' is included in the coursework folder
    %it is used to count the pixel in the same colour
    Histo = pixelCount(Pixel, col, row);

    if (plot_on)
        % plot color histogram 
        bar(Histo,'r');
        title('Histogram');
        xlabel('Value (Decimal)');
        ylabel('Count Number');

end