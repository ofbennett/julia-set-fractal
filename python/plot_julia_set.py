import matplotlib.pyplot as plt
import matplotlib.cm as cm
import pickle
import numpy as np

def save_image(data, cm, fn):
    sizes = np.shape(data)
    height = float(sizes[0])
    width = float(sizes[1])

    fig = plt.figure()
    fig.set_size_inches(width/height, 1, forward=False)
    ax = plt.Axes(fig, [0., 0., 1., 1.])
    ax.set_axis_off()
    fig.add_axes(ax)

    ax.imshow(data, cmap=cm)
    plt.savefig(fn, dpi=height)
    plt.close()

with open("julia_data","rb") as f:
    julia_set = pickle.load(f)
save_image(julia_set,cm.hot,'./julia_set.png')
