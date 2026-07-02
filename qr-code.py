
import qrcode
from qrcode.image.styledpil import StyledPilImage
from qrcode.image.styles.moduledrawers.pil import RoundedModuleDrawer
from qrcode.image.styles.colormasks import SolidFillColorMask

qr = qrcode.QRCode(error_correction=qrcode.constants.ERROR_CORRECT_H)
poster_url = 'https://ccbr.github.io/reproducible-toolchain/'
qr.add_data(poster_url)
colors = []
img = qr.make_image(image_factor=StyledPilImage, color_mask=SolidFillColorMask(),
                    fill_color="#19424e")
img.save("img/qrcode-poster.png")


qr = qrcode.QRCode(error_correction=qrcode.constants.ERROR_CORRECT_H)
nxf_template_url = 'https://github.com/CCBR/CCBR_NextflowTemplate'
qr.add_data(nxf_template_url)
colors = []
img = qr.make_image(image_factor=StyledPilImage, color_mask=SolidFillColorMask(),
                    fill_color="#19424e")
img.save("img/qrcode-nextflow-template.png")