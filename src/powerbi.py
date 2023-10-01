# src/powerbi.py
import streamlit as st

def show():
    st.title('Power BI Dashboard')
    st.write('Explore detailed insights and analytics in the interactive dashboard below.')

    # Adding buttons to link to the full dashboard and Novypro live
    st.markdown(
        """
        <a href="https://app.powerbi.com/view?r=eyJrIjoiOTM4OTQwYTktODIwYy00Y2M0LWE3ZWQtNDE5MDQ4NWQ0NjRhIiwidCI6ImRmODY3OWNkLWE4MGUtNDVkOC05OWFjLWM4M2VkN2ZmOTVhMCJ9" target="_blank">
            <button style='margin: 5px;'>View Full Dashboard</button>
        </a>
        <a href="https://www.novypro.com/project/telangana-growth-analysis-17" target="_blank">
            <button>Novypro Live</button>
        </a>
        """,
        unsafe_allow_html=True
    )

    powerbi_embed_url = "https://app.powerbi.com/view?r=eyJrIjoiOTM4OTQwYTktODIwYy00Y2M0LWE3ZWQtNDE5MDQ4NWQ0NjRhIiwidCI6ImRmODY3OWNkLWE4MGUtNDVkOC05OWFjLWM4M2VkN2ZmOTVhMCJ9"
    
    st.markdown(f'<iframe width="800" height="600" src="{powerbi_embed_url}" frameborder="0" allowFullScreen="true"></iframe>', unsafe_allow_html=True)
