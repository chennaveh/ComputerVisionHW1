% please notice:
% fill your code where you see empty []
% you can change this documnet as you wish. please notify me if you find
% any errors.
%
% Good luck 
% Yael & Nir

%% section A

% Q. a.

% generate an image with a 1x3 white patch
I_QAa = [];

% generate a mask
convMask_QAa = [];

% convolve mask and image 
Iresult_QAa = [];

% find maximal value location (using code!)
maxLocation_x = [];
maxLocation_y = [];

% show generated image & mark maximal value
figure();
imshow(I_QAa);
hold on;
plot(maxLocation_x, max_location_y, '*r')
title('QAa: original image with max value marked');

% show mask used
figure();
imshow(convMask_QAa, []);
title('QAa: masked used')

% show convolution result
figure();
imshow(Iresult_QAa, []);
title('QAa: convolution results');

% Q. b.
% please fill in a similar fashion to QAa

% Q. c.
% please fill in a similar fashion to QAa


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





