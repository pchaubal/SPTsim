include("./detectors.jl")
using .Detectors

function initialize_detectors()
    dets = []
    for i in 1:100
        det = Detectors.detector(i, i*0.05, i*0.05, [] )
        push!( dets, det )
    end
end

"iterares over the timestamps and records the signal for each detector"
function simulateTOD()
    for t in timestamps
        RA_center, DEC_center = scanpattern(t)
        for d in dets
            RA = RA_center + d.δRA
            DEC = DEC_center + d.δDEC
            pix_ind = get_pix_ind_from_RADEC(RA, DEC)
            sky_sig = sky[pix_ind]
            sig = sky_sig + atm_noise + electronic_noise
            push!(sig, d.TOD)
        end
    end
end

println(dets)