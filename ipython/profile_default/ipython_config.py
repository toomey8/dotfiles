# Configuration file for ipython.

c = get_config()

c.InteractiveShellApp.exec_lines = [
   'import numpy',
   'import scipy'
]

from __future__ import division
from IPython.utils import coloransi
from IPython.core import prompts
from pygments.token import Token


from IPython import *


config.TerminalInteractiveShell.highlighting_style_overrides = {Token.String: '#FFD700'}

config.TerminalInteractiveShell.autoindent = False


