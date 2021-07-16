#!/usr/bin/python3
import sys 
import os
#    status:
#    debian    =    working 100%
#    ubuntu    =    untested
#    fedora    =    untested
#    arch      =    untested
#    flatpak   =    working 100%

def apt():
     print("Updating APT Packages.")
     aptUp1 = "sudo apt update && "
     aptUp2 = "sudo apt upgrade -y --fix-broken && "
     aptUp3 = "sudo apt dist-upgrade -y --fix-broken && "
     aptUp4 = "sudo apt purge --auto-remove -y "
     os.system("/usr/bin/sudo -s " + aptUp1 + aptUp2 + aptUp3 + aptUp4)
     
def pac():
     pacUp1 = "sudo pacman -Syu"
     os.system("/usr/bin/sudo -s " + pacUp1)

def dnf():
     print("Updating DNF Packages.") 
     dnfUp1 = str("sudo dnf update -y")
     os.system("/usr/bin/sudo -s " + dnfUp1)

def flat():
     flatUp1 = str("sudo flatpak update -y")
     os.system("/usr/bin/sudo -s " + flatUp1)

def main():
     with open('/etc/os-release', 'r') as release:
          reading = release.readlines()
          if reading[5] == "ID=debian\n":
               apt()
          elif reading[5] == "ID=ubuntu\n":
               apt()
          elif reading[5] == "ID=arch\n":
               pac()
          elif reading[5] == "ID=fedora\n":
               dnf()
          else:
               print("Your distro is not supported.")
          if os.path.exists('/usr/bin/flatpak') == True:
               flat()
          else:
               print("Your flatpak is not installed.")

if __name__ == "__main__":
    main()