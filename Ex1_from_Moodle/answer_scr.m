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
Iresult_QAa = conv2(I_QAa, convMask_QAa);

% find maximal value location (using code!)
[maxLocation_y, maxLocation_x] = find(Iresult_QAa == max(Iresult_QAa(:)));
maxLocation_x = maxLocation_x - (size(convMask_QAa, 1) - 1); % rescaling after conv
maxLocation_y = maxLocation_y - (size(convMask_QAa, 2) - 1); % rescaling after conv

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
convMask_QAb = ones(3) / 9;

% convolve mask and image 
Iresult_QAb = conv2(I_QAb, convMask_QAb);

% find maximal value location (using code!)
[maxLocation_y, maxLocation_x] = find(Iresult_QAb == max(Iresult_QAb(:)));
maxLocation_x = maxLocation_x - (size(convMask_QAb, 1) - 1); % rescaling after conv
maxLocation_y = maxLocation_y - (size(convMask_QAb, 2) - 1); % rescaling after conv

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
Iresult_QAc = conv2(I_QAc, convMask_QAc);

% find maximal value location (using code!)
[maxLocation_y, maxLocation_x] = find(Iresult_QAc == max(Iresult_QAc(:)));
maxLocation_x = maxLocation_x - (size(convMask_QAc, 1) - 1); % rescaling after conv
maxLocation_y = maxLocation_y - (size(convMask_QAc, 2) - 1); % rescaling after conv

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
%im_test = createSyntheticImage_QBb();
%im_test_name = 'QBb_imageForCanny.jpg';
%imwrite(im_test, im_test_name);

L_th = [1];
H_th = [2];
sigmaCanny = [3];

%im_test_edges = canny(im_test_name, sigmaCanny ,L_th, H_th);
% figure;
% subplot(1, 2, 1);
% imshow(im_test, []);
% title('QBb: edges on synthetic  image');
% subplot(1, 2, 2);
% imshow(im_test_edges, []);
% title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

% Q. BC

% choose an image to run your edge detector on 
imageName_QBC = [];
%I_BC = imread(imageName_QBC);
L_th = [];
H_th = [];
sigmaCanny = [];

% run canny edge detector
% I_BC_edges = canny(imageName, sigmaCanny ,L_th, H_th);

% show results

% figure;
% subplot(1, 2, 1);
% imshow(I_BC, []);
% title('QBc: edges on Church  image');
% subplot(1, 2, 2);
% imshow(I_BC_edges, []);
% title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

% Q. BD 
% please fill in a similar way

% Q. BE
% please fill

%% section C

% Q. CG

% I_test_name = [];
% I_test = imread(I_test_name);
% I_test_GT = imread();

% please replace val1/2/3/.. with your values
% L_th = [val1 val2 val3];
% H_th = [val4 val5 val6];
% sigma = [val7 val8 val9];

% test values effect


% Q. CI
% create a function and test results





