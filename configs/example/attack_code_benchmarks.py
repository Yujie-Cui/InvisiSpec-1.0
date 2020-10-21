import m5
from m5.objects import *


#Spectre
attack_code = Process() # Added by Yujie
attack_code.executable = 'hello'
attack_code.cmd = [attack_code.executable]