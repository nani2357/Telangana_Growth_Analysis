import streamlit as st
import pandas as pd
import numpy as np
import pickle
from nbconvert import HTMLExporter
import nbformat
import streamlit.components.v1 as components
from src import home,powerbi,stamps,transport,ipass,presentation

st.set_page_config(layout="wide")
PAGES = {
    "Home": home,
     "Power BI Dashboard": powerbi,
     "Stamps Analysis": stamps,
     "Transport Analysis": transport,
     "TS-iPASS Analysis": ipass,
     "Presentation":presentation
    # Add other pages here as you create them
}

def main():
    st.sidebar.title('Navigation')
    selection = st.sidebar.radio("Go to", list(PAGES.keys()))
    page = PAGES[selection]
    page.show()

if __name__ == "__main__":
    main()