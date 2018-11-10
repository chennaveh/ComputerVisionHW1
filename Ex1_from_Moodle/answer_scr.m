% please notice:
% fill your code where you see empty []
% you can change this documnet as you wish. please notify me if you find
% any errors.
%
% Good luck 
% Yael & Nir

%% section A
clc,clear, close all;
I_QA = imread('Images\Images\Golf.jpg');
imageSize = size(I_QA);

% Q. a.
% generate a mask
convMask_QAa(1:5, 1:5) = -0.01;
convMask_QAa(3, 2:4) = 1/3;

% generate an image with a 1x3 white patch
I_QAa = I_QA;
patch = zeros(5);
patch(3, 2:4) = 255;
randomPosition = [randi([1 (imageSize(1) - 4)]) randi([1 (imageSize(2) - 4)])]; % random position for patch
I_QAa(randomPosition(1) : (randomPosition(1) + (size(convMask_QAa, 1) - 1)), randomPosition(2) : (randomPosition(2) + (size(convMask_QAa, 1) - 1))) = patch; % apply patch on image

% convolve mask and image 
Iresult_QAa = conv2(I_QAa, convMask_QAa,'same');

% find maximal value location (using code!)
[maxLocation_y, maxLocation_x] = find(Iresult_QAa == max(Iresult_QAa(:)));

% show generated image & mark maximal value
figure();
imshow(I_QAa);
hold on;axis on;
plot(maxLocation_x, maxLocation_y, '*r')
title('QAa: original image with max value marked');

% show mask used
figure();
imshow(convMask_QAa, []);
title('QAa: masked used')

% show convolution result
figure();
imshow(Iresult_QAa, []);
title('QAa: convolution results');

%% Q. b.

I_QAb = I_QA;
% generate a mask
convMask_QAb = ones(1, 9) / 9;

% convolve mask and image 
Iresult_QAb = conv2(I_QAb, convMask_QAb,'same');

% find maximal value location (using code!)
[maxLocation_y, maxLocation_x] = find(Iresult_QAb == max(Iresult_QAb(:)));

% show generated image & mark maximal value
figure();
imshow(I_QAb);
hold on;axis on;
plot(maxLocation_x, maxLocation_y, '*r')
title('QAb: original image with max value marked');

% show mask used
figure();
imshow(convMask_QAb, []);
title('QAb: masked used')

% show convolution result
figure();
imshow(Iresult_QAb, []);
title('QAb: convolution results');

%% Q. c.

I_QAc = I_QA;
% generate a mask
convMask_QAc = zeros(5);
convMask_QAc(3, 2:4) = 1 / 5;
convMask_QAc(2:4, 3) = 1 / 5;

% generate a patch image with a white '+' shape
patch = zeros(5);
patch(3, 2:4) = 255;
patch(2:4, 3) = 255;
randomPosition = [randi([1 (imageSize(1) - (size(convMask_QAc, 1) - 1))]) randi([1 (imageSize(2) - (size(convMask_QAc, 1) - 1))])]; % random position for patch
I_QAc(randomPosition(1) : (randomPosition(1) + (size(convMask_QAc, 1) - 1)), randomPosition(2) : (randomPosition(2) + (size(convMask_QAc, 1) - 1))) = patch; % apply patch on image

% convolve mask and image 
Iresult_QAc = conv2(I_QAc, convMask_QAc,'same');

% find maximal value location (using code!)
[maxLocation_y, maxLocation_x] = find(Iresult_QAc == max(Iresult_QAc(:)));

% show generated image & mark maximal value
figure();
imshow(I_QAc);
hold on;axis on;
plot(maxLocation_x, maxLocation_y, '*r')
title('QAac: original image with max value marked');

% show mask used
figure();
imshow(convMask_QAc, []);
title('QAc: masked used')

% show convolution result
figure();
imshow(Iresult_QAc, []);
title('QAc: convolution results');

%% section B
% after you write the functions uncomment and run:

% Q. BB.
% generate a synthetic image to test your canny edge detector
im_test = createSyntheticImage_QBb();
% imshow(im_test);

im_test_name = 'QBb_imageForCanny.jpg';
imwrite(im_test, im_test_name);

L_th = 10;
H_th = 18;
sigmaCanny = 3;

im_test_edges = canny(im_test_name, sigmaCanny ,L_th, H_th);
figure;
subplot(1, 2, 1);
imshow(im_test, []);
title('QBb: edges on synthetic  image');
subplot(1, 2, 2);
imshow(im_test_edges, []);
title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

%% Q. BC

% choose an image to run your edge detector on 
imageName_QBC = 'QBc_imageForCanny.jpg';
I_BC = imread(imageName_QBC);
L_th = 5;
H_th = 10;
sigmaCanny = 2;

% run canny edge detector
I_BC_edges = canny(imageName_QBC, sigmaCanny ,L_th, H_th);

% show results

figure;
subplot(1, 2, 1);
imshow(I_BC, []);
title('QBc: edges on My chosen image');
subplot(1, 2, 2);
imshow(I_BC_edges, []);
title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

%% Q. BD 

% Church.jpg
imageName_QBD = 'Images/Images/Church.jpg';
I_BD = imread(imageName_QBD);
L_th = 15;
H_th = 20;
sigmaCanny = 1;
I_BD_edges = canny(imageName_QBD, sigmaCanny ,L_th, H_th);
% show results
figure;
subplot(1, 2, 1);
imshow(I_BD, []);
title('QBd: edges on Church image');
subplot(1, 2, 2);
imshow(I_BD_edges, []);
title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

% Nuns.jpg
imageName_QBD = 'Images/Images/Nuns.jpg';
I_BD = imread(imageName_QBD);
I_BD_edges = canny(imageName_QBD, sigmaCanny ,L_th, H_th);
% show results
figure;
subplot(1, 2, 1);
imshow(I_BD, []);
title('QBd: edges on Nuns image');
subplot(1, 2, 2);
imshow(I_BD_edges, []);
title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

% Golf.jpg
imageName_QBD = 'Images/Images/Golf.jpg';
I_BD = imread(imageName_QBD);
I_BD_edges = canny(imageName_QBD, sigmaCanny ,L_th, H_th);
% show results
figure;
subplot(1, 2, 1);
imshow(I_BD, []);
title('QBd: edges on Golf image');
subplot(1, 2, 2);
imshow(I_BD_edges, []);
title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);
%% Q. BE

% Exploring parameters
imageName_QBD = 'Images/Images/Golf.jpg';
I_BD = imread(imageName_QBD);

% show results
figure;
subplot(2, 3, 1);
imshow(I_BD, []);
title('QBd: edges on Golf image');

%{
The sigma parameter affects the size of the window for computing the derivatives.
Low values generate thinner lines while be more subject to noise.
Higher values can detect blurred changes but will be more susceptible to higher frequencies.
This can be shown in [set 1, set 2] which detect the thick sky line.
In set 1 we can see some of the border on the right side, while in set 2
we can fully detect it. On the other hand we loose much of the accuracy
and high frequencies and get a distorted image.

The H_th is in charge for the pixel?s threshold. 
High values mean finer changes while low values will generate darker image with only the major frequencies.
We can notice this change in [set 4, set 5]. In set 5 we get a more ditailed 
image. We can see the fence and the vegetation behind it which can't be
seen in set 4.

The L_th is in charge for the thresholding the pixels around those with high values. 
Basically, lower values of L_th will generate images with less holes and more continuous lines, 
while higher values will give more control to H_th and will not affect the image.
We can notice those changes in [set 3, set 4] which differ only in this
parameter. In set 4 we get less holes in a continiuous line. This can be
seen if we zoom in and take a good look at the man's hat.
%}
L_th = 15; H_th = 20; sigmaCanny = 6;
I_BD_edges = canny(imageName_QBD, sigmaCanny ,L_th, H_th);
subplot(2, 3, 2); imshow(I_BD_edges, []); title(['Set 1: Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

% set 2
L_th = 15; H_th = 20; sigmaCanny = 12;
I_BD_edges = canny(imageName_QBD, sigmaCanny ,L_th, H_th);
subplot(2, 3, 3); imshow(I_BD_edges, []); title(['Set 2: Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

% set 3
L_th = 58; H_th = 60; sigmaCanny = 1;
I_BD_edges = canny(imageName_QBD, sigmaCanny ,L_th, H_th);
subplot(2, 3, 4); imshow(I_BD_edges, []); title(['Set 3: Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

% set 4
L_th = 1; H_th = 60; sigmaCanny = 1;
I_BD_edges = canny(imageName_QBD, sigmaCanny ,L_th, H_th);
subplot(2, 3, 5); imshow(I_BD_edges, []); title(['Set 4: Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

% set 5
L_th = 1; H_th = 20; sigmaCanny = 1;
I_BD_edges = canny(imageName_QBD, sigmaCanny ,L_th, H_th);
subplot(2, 3, 6); imshow(I_BD_edges, []); title(['Set 5: Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

%% section C
clear all;
clc;
% Q. CG
%Picture #1
imageName_QCG = 'Images/Images/Nuns.jpg';
I(1,:,:) = imread(imageName_QCG);
imageName_QCG_GT= 'Images/Images/Nuns_GT.bmp';
I_E_GT(1,:,:)=imread(imageName_QCG_GT);

%Picture #2
imageName_QCG = 'Images/Images/Church.jpg';
I(2,:,:) = imread(imageName_QCG);
imageName_QCG_GT= 'Images/Images/Church_GT.bmp';
I_E_GT(2,:,:)=imread(imageName_QCG_GT);

%Picture #3
imageName_QCG = 'Images/Images/Golf.jpg';
I(3,:,:) = imread(imageName_QCG);
imageName_QCG_GT= 'Images/Images/Golf_GT.bmp';
I_E_GT(3,:,:)=imread(imageName_QCG_GT);

I_FileNames = {'Images/Images/Nuns.jpg','Images/Images/Church.jpg','Images/Images/Golf.jpg'};
x=1;
figure(99); 
for i=1:3
    subplot(2, 3, x); imshow(squeeze(I(i,:,:)), []);title(['Loaded file ' I_FileNames{i}]);
    subplot(2, 3, x+1); imshow(squeeze(I_E_GT(i,:,:)), []);title(['Its related GT edge detection' I_FileNames{i}]);
    x=x+2;
end

% please replace val1/2/3/.. with your values
L_th = [1 15 70];
H_th = [10 50 90];
sigma = [1 2 3];

% test the values and display the images with the best results.
%return a marix 81X3 with all results (27 - first pic, 28-54 sec pic, 55+
%third one)
PRF_results = RunningTests(I_FileNames,I_E_GT,L_th,H_th,sigma,'naive','canny');

% Q. CI
% create a function and test results

% test values effect with imdilate
PRF_results_with_imdilates = RunningTests(I_FileNames,I_E_GT,L_th,H_th,sigma,'imdilate','canny');


%% section D
clear all;
clc;

%Picture #1
imageName_QCG_GT= 'Images/Images/Nuns_GT.bmp';
I_E_GT(1,:,:)=imread(imageName_QCG_GT);

%Picture #2
imageName_QCG_GT= 'Images/Images/Church_GT.bmp';
I_E_GT(2,:,:)=imread(imageName_QCG_GT);

%Picture #3
imageName_QCG_GT= 'Images/Images/Golf_GT.bmp';
I_E_GT(3,:,:)=imread(imageName_QCG_GT);


I_FileNames = {'Images/Images/Nuns.jpg','Images/Images/Church.jpg','Images/Images/Golf.jpg'};

%run sobel on 3 images
for i=1:3
    edges = sobel(I_FileNames{i},50);
    figure(i)
    imshow(edges);title(['Sobel Q.DJ: with th=50 on ' I_FileNames{i}])
end

% Q. DL
th = [3,14,50]; 

%calculate P,R,F for all pictures for all th posibilities
PRF_results = RunningTests(I_FileNames,I_E_GT,th,[-1],[-1],'naive','sobel');








