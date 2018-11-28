function reconstructFrame = reconstruct(videoHeight, videoWidth, MBsz, matchingBlock) 

    reconstructFrame = zeros(videoHeight + 5 , videoWidth + 5);
      for i = 1 : MBsz :  videoHeight
        a = (i-1)/MBsz + 1;    
        for j = 1 : MBsz : videoWidth
            b = (j-1)/MBsz + 1;        

            for ii = 1 : MBsz
                for jj = 1 : MBsz
                    reconstructFrame(ii + (i - 1),  jj + (j - 1)) ...
                    = matchingBlock(a, b).data(ii, jj);
                end
            end     

        end
      end
  
end
