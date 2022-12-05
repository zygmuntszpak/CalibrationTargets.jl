module CalibrationTargets

using ImageView
using Images
using TestImages
using ImageTransformations
using CoordinateTransformations
using Rotations

include("checkerboard.jl");
include("GeneratePoints.jl")
export generatepoints
export checkerboard
end
