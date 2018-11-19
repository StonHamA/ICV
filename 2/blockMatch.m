% �Ƿֺڰ׻��ǲ�ɫ�أ�
% ���ȼٶ��ڰף�
% ���ص���λ�ú�MSE
% ֻ��Ҫ������֮֡�����ϵ������, �������Ȳ���
%inputBlock ��Ҫһ��λ����Ϣ--locX��locY--��searchblock�ģ�1��1��; frame �Ǵ����֡
function [outputVal, vecX, vecY] = blockMatch(inputBlock,locX, locY, windowSize, frame)
    % ��д���Ҫ���block �ޥå��󥰣� ����֡���ҵ���Ӧ��block
    % ʹ��MSE
    [b, ~] = size(inputBlock); 
    w = windowSize;
    MSE = zeros((w - b+1), (w - b+1));

%     [matchingBlock, matchingWindow] = blockSWsize(b, w);
    % �Ȱ�matchingWindow������� 
    matchingWindow = double(frame(locX : (locX + windowSize - 1), locY : (locY + windowSize - 1)));
    % �ٰ�block ��searchingWindow�������
    for i = 1 : (w - b+1)
        for j = 1 : (w - b+1)
            matchingBlock = matchingWindow(i : i+b-1, j : j+b-1);
            temp = (matchingBlock - inputBlock) .^ 2;
            MSE(i, j) = sum(sum(temp));
        end
    end
    outputVal = min(min(MSE));
     [vecX, vecY]=find(MSE==min(min(MSE)));
end
            