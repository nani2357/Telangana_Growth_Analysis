# src/presentation.py
import streamlit as st
import streamlit.components.v1 as components
import base64  # Import the base64 module

def show():
    st.title('Presentation')
    st.write('View the PowerPoint presentation slides below.')

    # Embed the PDF file
    pdf_file = 'Power_BI_dash\Telangana_analysis_ppt.pdf'
    with open(pdf_file, "rb") as f:
        base64_pdf = base64.b64encode(f.read()).decode('utf-8')
    pdf_display = f'<embed src="data:application/pdf;base64,{base64_pdf}" width="1000" height="1000" type="application/pdf">'
    components.html(pdf_display, width=1000, height=1000)
