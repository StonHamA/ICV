% function written by Jingxiong Li 180770429
% this function is used to figure out coursework 4),
% after drawing the motion vector, use this function to reconstruct the
% predict frame.
% including moving and paste the blocks according to the motion vector and
% compensate function.
function reconstructFrame = reconstruct(videoHeight, videoWidth, MBsz, matchingBlock, compensate) 
% paste the blocks according to the motion vector
reconstructFrame = zeros(videoHeight + 5 , videoWidth + 5);
  for i = 1 : MBsz :  videoHeight
    a = (i-1)/MBsz + 1;    
    for j = 1 : MBsz : videoWidth
        b = (j-1)/MBsz + 1;        
        
        for ii = 1 : MBsz
            for jj = 1 : MBsz
                % move the block towards the motion vector and reconstruct the picture
                mbXY = matchingBlock(a, b).mbXY;
                reconstructFrame((ii - 1) + mbXY(1) + (i - 1),  jj - 1 + mbXY(2) + (j - 1)) ...
                = matchingBlock(a, b).data(ii, jj);
            end
        end     
        
    end
  end
  % compensation
if compensate
      nonZeroPoints = 0; 
    for i = 2 : videoHeight-1
        for j = 2 : videoWidth-1
           
            if  reconstructFrame(i , j) == 0
       %use the surrounding 8 pixels to confirm whether it will be filled             
                for a = -1 : 1
                        for b = -1 : 1
                            if reconstructFrame(i + a , j + b) > 0
                                nonZeroPoints = nonZeroPoints+1;

                            end                     
                        end
                end

     %if nonZeroPoints >=2, use left pixel to fill the lost
     %pixels
               if nonZeroPoints>=2 && j>=1 && i>=1 && j<=videoWidth && i<=videoHeight
                   reconstructFrame(i , j) =  reconstructFrame(i -1 , j-1);
               end
      % reset nonZeroPoints
               nonZeroPoints = 0; 
            end
        end
    end  
end
  
  

end
