import pandas as pd
import numpy as np

import matplotlib.pyplot as plt

def create_histogram(data, xlab = "", ylab = "", title = "", bin_count = 10):

    plt.hist(data, bins = bin_count)
    plt.xlabel(xlab)
    plt.ylabel(ylab)
    plt.title(title)

def create_bar_chart(x, height, xlab = "", ylab = "", title = "", fs = (10, 5), width = 0.4,):

    fig = plt.figure(figsize = fs)

    plt.bar(x, height, width)

    plt.xlabel(xlab)
    plt.ylabel(ylab)
    plt.title(title)