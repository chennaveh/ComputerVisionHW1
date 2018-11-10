function [P,R,F] =evaluate(E,E_GT)

%Calculate the 3 measures: P - Precision, R - Recall and F that combin both
%P and R while using imdilate to dilate the edges of the GT

SE = strel('square', 3);
E_GT_dilate = imdilate(E_GT , SE);
E = logical(E); %turn the matrix to a logical matrix

numerator = sum(and(E,E_GT_dilate),'all');
P = numerator /sum(E,'all'); % How many selected items are relevent
R = numerator /sum(E_GT_dilate,'all'); % How many relevent items are selected
F =(2*P*R)/(P+R);


%if you want to show the imdilate result:
% figure(11)
% imshow(E_GT_dilate,[])
% figure(12)
% imshow(E_GT,[])

end

