using Serialization

function julia_func(z)
    c = complex(-0.5, 0.61)
    z = z^2 +c
    return z
end

function gen_julia()
    im_width, im_height = 5000, 5000
    max_it = 300
    max_z2 = 100
    min_x, max_x = -1, 1
    min_y, max_y = -1, 1

    julia_set = zeros(im_width,im_height)
    for ix in 1:im_width
        for iy in 1:im_height
            real_part = ((max_x-min_x)/im_width)*ix + min_x
            im_part = ((max_y-min_y)/im_height)*iy + min_y
            z = complex(real_part, im_part)
            it = 0
            while(abs2(z) < max_z2 && it < max_it)
                z = julia_func(z)
                it += 1
            ratio = it/max_it
            julia_set[ix,iy] = ratio
            end
        end
    end
    return julia_set
end

function main()
    @time julia_set = gen_julia()
    serialize("julia_data",julia_set)
end

main()