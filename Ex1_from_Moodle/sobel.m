function [output] = sobel(file_name,th)
%SOBEL Summary of this function goes here
%   Running sobel edge detector. 
% input - filename
% th - theshold param of the detector

M_dy = [[-1,-2,-1];[0,0,0];[1,2,1]];
M_dx = M_dy';

% generate I_x, I_y
I = imread(file_name);
I_x = conv2(I, M_dx,'same');
I_y = conv2(I, M_dy,'same');

G_magnitute = (I_x.^2 + I_y.^2).^0.5;

% normelize all elements to 0-255
im_uint8 = uint8(G_magnitute / max(G_magnitute(:)) * 255); 
output = im_uint8 >= th;                       % high values 

end

