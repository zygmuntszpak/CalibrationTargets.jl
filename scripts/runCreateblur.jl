using CalibrationTargets
using ImageView
using Images
using TestImages
using ImageTransformations
using CoordinateTransformations
using Rotations
using ImageFiltering
using OffsetArrays

img = checkerboard(8,8);

blur_img = createblur(img,pi/1);

