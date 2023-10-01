import streamlit as st
import nbformat
from nbconvert import HTMLExporter
import streamlit.components.v1 as components

def show():
    st.title('TS-iPASS Analysis')
    st.write('Detailed analysis and insights from the TS-iPASS dataset.')

    # Read the Jupyter notebook file with utf-8 encoding
    with open('notebooks/ts-ipass.ipynb', 'r', encoding='utf-8') as f:
        notebook = nbformat.read(f, as_version=4)

    # Convert the Jupyter notebook to HTML
    html_exporter = HTMLExporter()
    html_exporter.template_name = 'classic'
    (body, _) = html_exporter.from_notebook_node(notebook)
    components.html(body, width=1000, height=1200, scrolling=True)
