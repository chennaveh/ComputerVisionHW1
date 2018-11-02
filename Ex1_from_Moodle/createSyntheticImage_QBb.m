function [output] = createSyntheticImage_QBb()
% Create synthetic image for edge detection testing
% the test image will be constructed from 4 different pieces

% Checker board
im1 = checkerboard(8,8);

% Rotetd checker board
im2 = imrotate(checkerboard(8,8), 45,'crop');

% Sinusoid grid
[x,y] = meshgrid(sin(1:0.1:13.7),sin(1:0.1:13.7));
im3 = x.*y;

% Phantom image
im4 = phantom(128);

% Concat 4 imgaes and add some noise in the center of the image
output = [im1 im2; im3 im4];
output(64:end-64,64:end-64) = imnoise(output(64:end-64,64:end-64), 'speckle');
output(64:end-64,64:end-64) = imnoise(output(64:end-64,64:end-64), 'gaussian');
end

