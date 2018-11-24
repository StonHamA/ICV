reconstructFrame = zeros(videoHeight + 50 , videoWidth + 50 );
  
for i = 1 : MBsz :  videoHeight
    a = (i-1)/MBsz + 1;    
    for j = 1 : MBsz : videoWidth
        b = (j-1)/MBsz + 1;        
        
        for ii = 1 : MBsz
            for jj = 1 : MBsz
                mbXY = matchingBlock(a, b).mbXY;
                reconstructFrame(a+ii+i-1, b + jj+j -1 ) ...
                = matchingBlock(a, b).data(ii, jj);            
            end
        end
    end
end
reconstructFrame = reconstructFrame;
  imshow(uint8(reconstructFrame));
