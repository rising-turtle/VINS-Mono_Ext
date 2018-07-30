imageD = imread('1.png');
% pinhole-equi-512
intri = [190.97847715128717, 190.9733070521226, 254.93170605935475, 256.8974428996504];
D = [0.0034823894022493434, 0.0007150348452162257, -0.0020532361418706202, 0.00020293673591811182];
fu = intri(1);
fv = intri(2);
pu = intri(3);
pv = intri(4);

K = [fu 0 pu
    0 fv pv
    0 0 1];
unImg = Undistort(imageD, D, K, 'equi');
imshow(unImg);
