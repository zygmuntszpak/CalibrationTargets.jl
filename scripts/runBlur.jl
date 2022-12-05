using CalibrationTargets
img = checkerboard(3,3)

bimg = imfilter(img,Kernel.gaussian(3))