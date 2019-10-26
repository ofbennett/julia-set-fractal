using Plots
using Serialization
function make_fig()
    julia_set = deserialize("julia_data")
    gr()
    img = heatmap(julia_set,legend=:none,axis=nothing,size=size(julia_set))
    savefig(img,"./julia_set.png")
end

make_fig()