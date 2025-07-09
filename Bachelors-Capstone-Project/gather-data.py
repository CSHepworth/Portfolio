import pandas as pd
import requests
from bs4 import BeautifulSoup

link = "https://www.draglist.com/draglist/category.php?VIEW=Compact&CATEGORY%5B0%5D=TOPFUEL&x=dragsters&SORTBY=&page="

def get_data_from_url(l):
    data = pd.DataFrame()
    i = 1
    for i in range(1, 3):
        url = l + str(i)
        r = requests.get(url)
        soup = BeautifulSoup(r.content, "html.parser")
        s = soup.find("table", class_ = "draglist")
        d = pd.read_html(str(s))[0]
        data = pd.concat([data, d], axis = 0)

    print(data)

get_data_from_url(link)
