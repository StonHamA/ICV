%这个函数能在输入图片上画SearchWindow和MatchingBlock
%思路：1）需要输入MatchingBlock（已相对SW定位）；SearchWindow（已相对Frame定位）；图片信息
%           2）输出： 图片（标好SW和MB，不同颜色）
%           3*）可以兼有画MotionVector。
% videoHeight, videoWidth,
function adFrame = windowPaint(MBx, MBy, MBsz, SWx, SWy, SWsz, frame)
    % 先定义图像
     adFrame = frame;
    % 着色， 画SW, 效果是一黑框
    for i = SWx : SWx + SWsz - 1 
        for j = SWy : SWy + SWsz -1
            if (i == SWx) || (i == (SWx + SWsz - 1)) ||...
                    (j == SWy) || (j == (SWy + SWsz -1))
                adFrame(i, j) = 0;
            end
        end
    end
    %画MW，效果为一白框
    for i = SWx + MBx - 1 : SWx + MBx + MBsz  - 1 - 1
        for j = SWy + MBy - 1 : SWy + MBy + MBsz  - 1 - 1
            if (i == (SWx + MBx - 1)) || (i == (SWx + MBx+ MBsz  - 1 - 1)) ||...
                    (j == (SWy + MBy - 1)) || (j == (SWy + MBy + MBsz  - 1 - 1))
                adFrame(i, j) = 255;
            end
        end
    end
    
    
end