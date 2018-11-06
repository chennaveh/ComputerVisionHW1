function [output] = sobel(file_name,th)
%SOBEL Summary of this function goes here
%   Detailed explanation goes here

M_dy = [[-1,-2,-1];[0,0,0];[1,2,1]];
M_dx = M_dy';

% generate I_x, I_y
I = imread(file_name);
I_x = conv2(I, M_dx,'same');
I_y = conv2(I, M_dy,'same');

G_magnitute = (I_x.^2 + I_y.^2).^0.5;

% hysteresis thresholding - 8 neighbors
im_uint8 = uint8(G_magnitute / max(G_magnitute(:)) * 255); 
bin_im_hi_th = im_uint8 >= th;                       % high values 
%mask = true(3, 3);
%bin_hi_neighbors = logical(conv2(bin_im_hi_th, mask)); % find neighbores of high values
%bin_result = (bin_hi_neighbors(2:end-1, 2:end-1) & bin_im_lo_th) | bin_im_hi_th; % gather requested pixels

output = bin_im_hi_th;


end

