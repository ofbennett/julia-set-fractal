using Serialization

function julia_func(z,frame)
    k = frame*0.002
    c = complex(-0.5, 0.66-k)
    z = z^2 +c
    return z
end

function gen_julia(julia_set,frame,im_width,im_height)
    
    max_it = 300
    max_z2 = 100
    min_x, max_x = -1, 1
    min_y, max_y = -1, 1

    for ix in 1:im_width
        for iy in 1:im_height
            real_part = ((max_x-min_x)/im_width)*ix + min_x
            im_part = ((max_y-min_y)/im_height)*iy + min_y
            z = complex(real_part, im_part)
            it = 0
            while(abs2(z) < max_z2 && it < max_it)
                z = julia_func(z,frame)
                it += 1
            ratio = it/max_it
            julia_set[ix,iy,frame] = ratio
            end
        end
    end
    return julia_set
end

function main()
    frames = 50
    im_width, im_height = 1000, 1000
    julia_set = zeros(im_width,im_height,frames)
    for frame in 1:frames
        gen_julia(julia_set,frame,im_width,im_height)
    end
    
    serialize("./data/julia_data",julia_set)
end

main()