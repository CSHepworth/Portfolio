import pandas as pd
import numpy as np
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix, accuracy_score
from sklearn.cluster import KMeans

import matplotlib.image as mpimg
import matplotlib.pyplot as plt
import matplotlib.cm as cm
import seaborn as sns

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

def add_vline(x, min = 0, max = 1, c = "red", l = ""):

    plt.vlines(x = x, ymin = min, ymax = max, colors = c, label = l)
    plt.legend()

def sub_count(col, sub_1, sub_2, split):

    sub_1_title = "Rows missing fewer than {} value(s)".format(split)
    sub_2_title = "Rows missing greater than {} value(s)".format(split)

    fig, (ax1, ax2) = plt.subplots(1, 2, sharey = True, figsize = (10, 5))
    sns.countplot(x = sub_1[col], ax = ax1)
    ax1.set_title(sub_1_title)

    sns.countplot(x = sub_2[col], ax = ax2)
    ax2.set_title(sub_2_title)


def apply_feature_scaling(scaler, df):

    scaler = StandardScaler()

    scaled_df = scaler.fit_transform(df)

    return scaled_df

"""
PCA Functions
"""

def do_pca(df, n_components = 0):

    if n_components == 0:

        pca = PCA()

    else:

        pca = PCA(n_components)
        
    pca_df = pca.fit_transform(df)

    return pca, pca_df



def plot_pca(pca, xlab, ylab, title):

    n_comp = len(pca.explained_variance_ratio_)
    idx = np.arange(n_comp)
    vals = pca.explained_variance_ratio_

    plt.figure(figsize = (10, 6))
    ax = plt.subplot(111)
    cumulative_vals = np.cumsum(vals)
    ax.bar(idx, vals, color = "b")
    ax.plot(idx, cumulative_vals, color = "black")

    ax.set_xlabel(xlab)
    ax.set_ylabel(ylab)
    plt.title(title)


def print_mapped_weights_at_index(df, idx):

    return df.iloc[idx].sort_values(ascending = False)

def store_upper_lower_ranges(df, idx, upper_range = 3, lower_range = 3):

    full_data = df.iloc[idx].sort_values(ascending = False)

    upper_data = full_data.head(upper_range)

    lower_data = full_data.tail(lower_range)

    # ab = abridged
    upper_lower_data = pd.concat([upper_data, lower_data])

    return upper_lower_data



# Accepts a list of intergers for clusters and pca data to be clustered. 
# Returns a list of scores.
def perform_clustering(clusters, pca):

    scores = []

    for c in clusters:

        kmeans = KMeans(n_clusters = c)

        m = kmeans.fit(pca)

        score = np.abs(m.score(pca))
        
        scores.append(score)

    return scores

# Plots the cluster score relationship
def plot_cluster_score(clusters, scores, xlab, ylab, title):

    plt.plot(clusters, scores, marker = "s", color = "red")
    plt.xlabel(xlab)
    plt.ylabel(ylab)
    plt.title(title)
    plt.show()

def refit_kmeans_and_predict(nc, pca_df, no_fit = True):

    kmeans = KMeans(n_clusters = nc)

    if no_fit:

        pred = kmeans.predict(pca_df)

    else:

        pred = kmeans.fit_predict(pca_df)

    return pred

def compare_preds(pred_1, pred_1_title, pred_2, pred_2_title):

    from collections import Counter

    labels, values = zip(*Counter(pred_1).items())
    v = list(values)
    v[:] = [x / len(pred_1) for x in v]
    indexes = np.arange(len(labels))

    labels1, values1 = zip(*Counter(pred_2).items())
    v1 = list(values1)
    v1[:] = [x / len(pred_2) for x in v1]
    indexes1 = np.arange(len(labels1))

    width = 0.5
    plt.bar(indexes1, v1, width, label = pred_2_title)
    plt.bar(indexes + width, v, width, color = "r", label = pred_1_title)

    plt.xticks(indexes1 + width * 0.5, labels)

    plt.legend(loc = "upper right")

    plt.show()


def inv_transform_feature(cluster, scaler, pca, df, pred, cols):

    clust = scaler.inverse_transform(pca.inverse_transform(df[np.where(pred == cluster)])).round()

    clust_df = pd.DataFrame(data = clust, index = np.array(range(0, clust.shape[0])), columns = cols)

    return clust_df

def print_impact_col_avg(df, cols):

    for col in cols:

        avg = df[col].mean()

        print("{}: {}\n".format(col, avg))