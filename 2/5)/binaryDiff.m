function frameDiff =  binaryDiff(videoHeight, videoWidth, frameCount, frameDiff, threshold) 
    %1. 分析frameDiff把关键点标记
    %2. 从别的帧里找出未标记点复制
    %（初始化）all zero
    %读取Diff里的第二帧减第一帧的差，负数全部算作0    
    for k = 2 : frameCount
        for i = 1 : videoHeight
            for j = 1 : videoWidth

                if frameDiff(k).data(i, j) < 0 || frameDiff(2).data(i, j) <= threshold  
                    frameDiff(k).binData(i, j) = 0;
                end
                if frameDiff(k).data(i, j) > threshold
                    frameDiff(k).binData(i, j) = 255;
                end     

            end
        end
    end
    
end