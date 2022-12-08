using CalibrationTargets
using ImageView
using Images
using TestImages
using ImageTransformations
using CoordinateTransformations
using Rotations
using ImageFiltering
using OffsetArrays
img = checkerboard(8,8)

# define transformation
trfm = recenter(RotMatrix(pi/4), center(img));
imgw = warp(img, trfm);

bimg = imfilter(imgw,Kernel.gaussian(3))

trfm = recenter(RotMatrix(-pi/4), center(img));

fimg = warp(bimg,trfm);

width, height = size(img)

#Cropping back to original size
final = fimg[1:width, 1:height];

display(final);