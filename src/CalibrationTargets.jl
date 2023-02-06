module CalibrationTargets

using ImageView
using Images
using TestImages
using ImageTransformations
using CoordinateTransformations
using Rotations
using ImageFiltering
using Statistics
using Interpolations

include("create_blur.jl")
include("checkerboard.jl")
include("generate_points.jl")
include("create_max_blur.jl")
include("pick_maximum_response.jl")
include("template.jl")
include("non_max_supress.jl")
include("detect_points.jl")
include("construct_mask.jl")
include("gradient_carving_elimination.jl")
include("median_dist_elim.jl")
include("checkerboard_points.jl")
include("seam_carving.jl")
include("find_points.jl")

export Template     # Template struct
export seam_carving_down!
export seam_carving_up!
export find_points
export remove_after_carve
export checkerboard_points
export median_dist_elim
export gradient_carving_elimination
export construct_sectors
export detect_points
export createmaxblur
export createblur
export generatepoints
export checkerboard
export pick_maximum_response
export non_max_supress

end
