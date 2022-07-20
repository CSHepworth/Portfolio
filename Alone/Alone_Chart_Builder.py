#%%
from turtle import width
import pandas as pd
import altair as alt
import numpy as np

Survivor_Data = pd.read_csv('Alone_Survivor_Data.csv')

#%%
gendercountchart = (alt.Chart(Survivor_Data)
    .encode(
        x="Gender",
        y='count(Gender):Q',
        color="Gender"
    )
    .mark_bar(
            
    )
    .properties(
        height=360,
        width=200
    )    
)

gendercountchart

# %%
agevsdays = (alt.Chart(Survivor_Data)
    .encode(
        x="Age",
        y="Total Days",
        color="Gender"
    )
    .mark_point()
    .properties(
        height=500,
        width=500
    )
)

agevsdays
# %%
