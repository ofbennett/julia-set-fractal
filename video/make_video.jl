using Plots
using Serialization
function make_fig()
    julia_set = deserialize("./data/julia_data")
    frames = size(julia_set)[end]
    gr()
    for frame in 1:frames
        img = heatmap(julia_set[:,:,frame],legend=:none,axis=nothing, size=size(julia_set[:,:,frame]))
        if frame < 10
            savefig(img,"./imgs/julia_set_0$frame.png")
        elseif frame < 100
            savefig(img,"./imgs/julia_set_$frame.png")
        else
            println("If more than 100 frames code needs to be modified here")
        end
    end
    run(`ffmpeg -r 10 -i ./imgs/julia_set_%02d.png julia_video.gif`)
end

make_fig()