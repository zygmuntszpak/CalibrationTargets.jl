module CalibrationTargets

using ImageView
using Images
using TestImages
using ImageTransformations
using CoordinateTransformations
using Rotations
using ImageFiltering
using Interpolations

include("create_blur.jl")
include("checkerboard.jl")
include("generate_points.jl")
include("create_max_blur.jl")
include("pick_maximum_response.jl")
include("template.jl")
include("non_max_supress.jl")
include("detect_points.jl")

export Template     # Template struct

export detect_points
export createmaxblur
export createblur
export generatepoints
export checkerboard
export pick_maximum_response
export non_max_supress

end
