function reconstructFrame = reconstruct(videoHeight, videoWidth, MBsz, matchingBlock) 

reconstructFrame = zeros(videoHeight + 5 , videoWidth + 5);
  for i = 1 : MBsz :  videoHeight
    a = (i-1)/MBsz + 1;    
    for j = 1 : MBsz : videoWidth
        b = (j-1)/MBsz + 1;        
        
        for ii = 1 : MBsz
            for jj = 1 : MBsz
                mbXY = matchingBlock(a, b).mbXY;
                %mbXY是（3，3）在searchWindow
                %的中央因为用中心加的话容易产生负数，reconstructFrame无法进行，所以直接加上（3，3）
                reconstructFrame((ii - 1) + mbXY(1) + (i - 1),  jj - 1 + mbXY(2) + (j - 1)) ...
                = matchingBlock(a, b).data(ii, jj);
            end
        end     
        
    end
  end
  
  

end
