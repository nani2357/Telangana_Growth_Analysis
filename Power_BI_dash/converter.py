from pptx import Presentation
from pptx.util import Inches
from io import BytesIO
from PIL import Image

# Load the PowerPoint presentation
ppt_file = 'path_to_your_ppt_file.pptx'
presentation = Presentation(ppt_file)

# Convert each slide to an image
images = []
for i, slide in enumerate(presentation.slides):
    image_stream = BytesIO()
    slide_image = Image.new('RGB', (presentation.slide_width.pt, presentation.slide_height.pt), 'white')
    slide_image.save(image_stream, format='PNG')
    images.append(image_stream.getvalue())

# Save images to files
for i, image in enumerate(images):
    with open(f'slide_{i}.png', 'wb') as f:
        f.write(image)
