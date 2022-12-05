using CalibrationTargets

img = checkerboard(3,3)

# define transformation
trfm = recenter(RotMatrix(pi/4), center(img));
imgw = warp(img, trfm);

bimg = imfilter(imgw,Kernel.gaussian(3))

trfm = recenter(RotMatrix(-pi/4), center(img));

fimg=warp(bimg,trfm)