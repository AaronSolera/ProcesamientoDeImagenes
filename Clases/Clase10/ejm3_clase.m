clc; clear; close all
pkg load image

A = imread('files/child.jpg');
subplot(1, 2, 1)
imshow(A)

% Crear la mascara del filtro promedio
k = 3;
B = (1 / k^2) * ones(k, k);
A = im2double(A);
C = conv2(A, B, 'same');
C = im2uint8(C);
subplot(1, 2, 2)
imshow(C)