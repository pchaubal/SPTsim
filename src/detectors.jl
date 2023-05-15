"Has detectors level stuff"
module Detectors

mutable struct detector
    id :: Int32
    δRA :: Float32
    δDEC :: Float32
    TOD :: Vector{Float32}
end



end