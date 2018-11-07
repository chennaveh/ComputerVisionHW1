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
Iresult_QAa = conv2(I_QAa, convMask_QAa,'same');%TODO -  she asked to use 'same'

% find maximal value location (using code!)
[maxLocation_y, maxLocation_x] = find(Iresult_QAa == max(Iresult_QAa(:)));
%if we use 'same' there is no need for correction of the location
%maxLocation_x = maxLocation_x - (size(convMask_QAa, 1) - 1); % rescaling after conv
%maxLocation_y = maxLocation_y - (size(convMask_QAa, 2) - 1); % rescaling after conv

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
convMask_QAb = ones(3) / 9; % TODO - the mask should be 1X9

% convolve mask and image 
Iresult_QAb = conv2(I_QAb, convMask_QAb,'same');

% find maximal value location (using code!)
[maxLocation_y, maxLocation_x] = find(Iresult_QAb == max(Iresult_QAb(:)));
%maxLocation_x = maxLocation_x - (size(convMask_QAb, 1) - 1); % rescaling after conv
%maxLocation_y = maxLocation_y - (size(convMask_QAb, 2) - 1); % rescaling after conv

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
%maxLocation_x = maxLocation_x - (size(convMask_QAc, 1) - 1); % rescaling after conv
%maxLocation_y = maxLocation_y - (size(convMask_QAc, 2) - 1); % rescaling after conv

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
% after you write the functions uncomment and run: ?????
close all;close all; clc
file_name = 'Images\Images\Nuns.jpg';
edges_im = canny(file_name, 3, 10, 18);
figure(); imshow(edges_im); title('final');

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

% set 1
L_th = 15; H_th = 20; sigmaCanny = 6;
I_BD_edges = canny(imageName_QBD, sigmaCanny ,L_th, H_th);
subplot(2, 3, 2); imshow(I_BD_edges, []); title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

% set 2
L_th = 15; H_th = 20; sigmaCanny = 12;
I_BD_edges = canny(imageName_QBD, sigmaCanny ,L_th, H_th);
subplot(2, 3, 3); imshow(I_BD_edges, []); title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

% set 3
L_th = 70; H_th = 60; sigmaCanny = 1;
I_BD_edges = canny(imageName_QBD, sigmaCanny ,L_th, H_th);
subplot(2, 3, 4); imshow(I_BD_edges, []); title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

% set 4
L_th = 1; H_th = 60; sigmaCanny = 1;
I_BD_edges = canny(imageName_QBD, sigmaCanny ,L_th, H_th);
subplot(2, 3, 5); imshow(I_BD_edges, []); title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

% set 5
L_th = 1; H_th = 20; sigmaCanny = 1;
I_BD_edges = canny(imageName_QBD, sigmaCanny ,L_th, H_th);
subplot(2, 3, 6); imshow(I_BD_edges, []); title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

%% section C
clear all;
clc;
% Q. CG
%Picture #1
imageName_QCG = 'Images/Images/Golf.jpg';
I(1,:,:) = imread(imageName_QCG);
imageName_QCG_GT= 'Images/Images/Golf_GT.bmp';
I_E_GT(1,:,:)=imread(imageName_QCG_GT);

%Picture #2
imageName_QCG = 'Images/Images/Church.jpg';
I(2,:,:) = imread(imageName_QCG);
imageName_QCG_GT= 'Images/Images/Church_GT.bmp';
I_E_GT(2,:,:)=imread(imageName_QCG_GT);

%Picture #3
imageName_QCG = 'Images/Images/Nuns.jpg';
I(3,:,:) = imread(imageName_QCG);
imageName_QCG_GT= 'Images/Images/Nuns_GT.bmp';
I_E_GT(3,:,:)=imread(imageName_QCG_GT);

I_FileNames = {'Images/Images/Nuns.jpg','Images/Images/Church.jpg','Images/Images/Golf.jpg'};
x=1;
figure(99); 
for i=1:3
    subplot(2, 3, x); imshow(squeeze(I(i,:,:)), [])
    subplot(2, 3, x+1); imshow(squeeze(I_E_GT(i,:,:)), [])
    x=x+2;
end

% please replace val1/2/3/.. with your values
L_th = [1 15 70];
H_th = [1 50 90];
sigma = [1 6 12];

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
imageName_QCG_GT= 'Images/Images/Golf_GT.bmp';
I_E_GT(1,:,:)=imread(imageName_QCG_GT);

%Picture #2
imageName_QCG_GT= 'Images/Images/Church_GT.bmp';
I_E_GT(2,:,:)=imread(imageName_QCG_GT);

%Picture #3
imageName_QCG_GT= 'Images/Images/Nuns_GT.bmp';
I_E_GT(3,:,:)=imread(imageName_QCG_GT);

I_FileNames = {'Images/Images/Nuns.jpg','Images/Images/Church.jpg','Images/Images/Golf.jpg'};

%run sobel on 3 images
for i=1:3
    edges = sobel(I_FileNames{i},50);
    figure(i)
    imshow(edges)
end

% Q. DL
th = [50 100 200]; 
%calculate P,R,F for all pictures for all th posibilities
PRF_results = RunningTests(I_FileNames,I_E_GT,th,[1],[1],'naive','sobel');








