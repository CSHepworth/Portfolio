import urllib.parse
import urllib.request

import pandas as pd
pd.options.mode.chained_assignment = None

from bs4 import BeautifulSoup


link = "https://docs.google.com/document/d/e/2PACX-1vQGUck9HIFCyezsrBSnmENk5ieJuYwpt7YHYEzeNJkIb9OSDdx-ov2nRNReKQyey-cwJOoEKUhLmN9z/pub"

# Reads the url and returns an html file
def read_url(l):

    file = urllib.request.urlopen(l)
    html = file.read()

    return html

# Extracts table from html file and returns table as pandas dataframe
def extract_table(html):

    soup = BeautifulSoup(html, "html.parser")

    tables = pd.read_html(str(soup))

    table = tables[0]

    table.columns = table.iloc[0]

    table = table.iloc[1:]

    table["x-coordinate"] = table["x-coordinate"].astype(int)

    table["y-coordinate"] = table["y-coordinate"].astype(int)

    return table

# Decodes and prints the message
def decode_message(link):

    html = read_url(link)

    table = extract_table(html)

    for i in reversed(range(table["y-coordinate"].min(), table["y-coordinate"].max() + 1)):
        line = []
        temp_df = table[table["y-coordinate"] == i]
        temp_df = temp_df.sort_values("x-coordinate")
        for j in range(table["x-coordinate"].min(), table["x-coordinate"].max() + 1):
            if j in temp_df["x-coordinate"].values:
                row_idx = temp_df.index.get_loc(temp_df[temp_df["x-coordinate"] == j].index[0])
                col_indx = temp_df.columns.get_loc("Character")
                char = temp_df.iloc[row_idx, col_indx]
                line.append(char)
            else:
                line.append(" ")
        decoded_message_line = "".join(line)
        print(decoded_message_line)

decode_message(link)

