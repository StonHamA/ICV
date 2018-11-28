function backGround = backGroundGen(videoHeight, videoWidth, frameCount, frameDiff, frameGrey, fast) 
%% ²¹³¥
    backGround = zeros(videoHeight, videoWidth);
    for i = 1 : videoHeight
        for j = 1 : videoWidth
            for k = 2 : frameCount
                
                judgeElement = 0;
                if k <= frameCount - 20
                    
                    for l = 1 : 20
                        judgeElement =  judgeElement + frameDiff(k + l - 1).binData(i, j);
                    end
                    
                    if judgeElement == 0
                        backGround(i, j) = frameGrey(k).data(i,j);
                    end
                end
               if fast
                    if backGround(i,j) ~= 0
                        break;
                    end
               end
                                
            end
        end
    end
end
    



