[frameGrey, videoHeight, videoWidth] = init();

%% 
BlockSize = 3;
    %判断(大于中心点)
for c = 1 : 6    
    singleFrameGrey1 = frameGrey(c).data;
    tFrame = zeros(videoHeight, videoWidth);
    LBPBlock = zeros(BlockSize);
    mid = (BlockSize+1)/2;
    for i = 1 : videoHeight - mid
        for j = 1 : videoWidth - mid
            LBPBlock = singleFrameGrey1(i : i + mid, j : j + mid);
            midBlock = LBPBlock(mid,mid);            
            for k = 1 : BlockSize
                for l = 1 : BlockSize                    
                    if LBPBlock(k, l) > midBlock
                        LBPBlock(k, l) = 1;
                    else
                        LBPBlock(k, l) = 0;
                    end                                                                                                  
                end
            end            
            %直接存储十进制，最后做转换即可
            tFrame(i+1, j+1) =  LBPBlock(2, 1) * 2^7 ...
                                              +LBPBlock(3, 1) * 2^6 ...
                                              +LBPBlock(3, 2) * 2^5 ...
                                              +LBPBlock(3, 3) * 2^4 ...
                                              +LBPBlock(2, 3) * 2^3 ...
                                              +LBPBlock(1, 3) * 2^2 ...
                                              +LBPBlock(1, 2) * 2^1 ...
                                              +LBPBlock(1, 1) * 2^0 ;      
        end        
    end
    texture(c).data = tFrame;    
    texture(c).histo = myHisto(tFrame, 0);
end
        imshow(uint8(texture(1).data));
%% Histogram
for i = 1 : 6
    texture(i).nHisto = normalize(texture(i).histo, 'norm', 1);
end

%% 