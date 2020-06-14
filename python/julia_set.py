import numpy as np
import pickle
import time

def julia_func(z):
    c = complex(-0.5, 0.61)
    z = z**2 + c
    return z

def gen_julia():
    im_width, im_height = 5000, 5000
    max_it = 300
    max_z = 100
    min_x, max_x = -1, 1
    min_y, max_y = -1, 1

    julia_set = np.zeros((im_width, im_height))
    for ix in range(im_width):
        for iy in range(im_height):
            real_part = ((max_x-min_x)/im_width)*ix + min_x
            im_part = ((max_y-min_y)/im_height)*iy + min_y
            z = complex(real_part, im_part)
            it = 0
            while(abs(z) < max_z and it < max_it):
                z = julia_func(z)
                it += 1
            ratio = it/max_it
            julia_set[ix, iy] = ratio
    return julia_set

def main():
    t1 = time.time()
    julia_set = gen_julia()
    t2 = time.time()
    print("Time to complete julia set: {:2f} secs".format(t2-t1))
    with open("julia_data", "wb") as f:
        pickle.dump(julia_set, f)

main()
