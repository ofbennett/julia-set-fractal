import numpy as np
import pickle
import time

def gen_julia():
    im_width, im_height = 5000, 5000
    max_it = 300
    max_z = 100
    min_x, max_x = -1, 1
    min_y, max_y = -1, 1
    c = complex(-0.5, 0.61)

    ix_array, iy_array = np.meshgrid(range(im_width),range(im_height))

    real_part = ((max_x-min_x)/im_width)*ix_array + min_x
    im_part = ((max_y-min_y)/im_height)*iy_array + min_y
    z = real_part + (1j)*im_part

    not_done = np.ones((im_width, im_height)) # Array which records which pixels have not finished being computed
    it = np.zeros((im_width, im_height))

    while np.any(not_done):
        not_done = np.logical_and(np.abs(z) < max_z, it < max_it)
        z[not_done] = z[not_done]**2 + c
        it[not_done] +=1

    julia_set = it/max_it
    return julia_set

def main():
    t1 = time.time()
    julia_set = gen_julia()
    t2 = time.time()
    print("Time to complete julia set: {:2f} secs".format(t2-t1))
    with open("julia_data", "wb") as f:
        pickle.dump(julia_set, f)

main()
