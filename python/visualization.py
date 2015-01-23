
# ipthon defaults

# %precision 3

from IPython.utils import coloransi
from IPython.core import prompts
termcolors = coloransi.TermColors() # the color table

dark = prompts.PColLinux.colors
light = prompts.PColLightBG.colors
dark.in_normal = termcolors.Yellow
light.in_normal = termcolors.Yellow
dark.normal = light.normal = termcolors.Yellow

prompt_in1 = r'\C_LightBlue[\C_LightCyan\Y2\C_LightBlue]\C_Normal\n\C_Green|\#>'
prompt_in2 = r'.\D: '
prompt_out = r'[\#] '

# import libraries

from sympy import *
from numpy import *
from pandas import *
from random import *
from scipy.stats import *
from matplotlib import *
from seaborn import *
import sys
import subprocess

# Seaborn defaults

set_palette("deep", desat=.6)
set_context(rc={"figure.figsize": (28, 24)})
set(font="Garamond")
set_context("talk", font_scale=1.3)
subprocess.call("defaults write org.python.python ApplePersistenceIgnoreState NO",shell=True)

# use chrome for figues

def show(fig):
    subprocess.call("rm test.svg",shell=True)
    fig.savefig('test.svg')
    subprocess.call("open Chrome-SVG.html",shell=True)

def see(equation):
    f = open("latex.txt","w")
    f.write(latex(equation))
    f.close()
    subprocess.call("cat head.html latex.txt tail.html > latex.html",shell=True)
    subprocess.call("open latex.html",shell=True)

def ChromeSVG(fig):
    f = open("latex.txt","w")
    f.write(latex(equation))
    f.close()
    subprocess.call("cat head.html latex.txt tail.html > latex.html",shell=True)
    subprocess.call("open latex.html",shell=True)
