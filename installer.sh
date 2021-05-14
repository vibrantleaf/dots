#!/bin/bash
# script to restore the dots and pkgs i use.
# based on hexdsl's hextool script https://gitlab.com/hexdsl/dots/-/blob/master/hextool

me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
u="$USER"

menu()
	{
		echo "usage:   " $me "[OPTION]"
		echo " "
		echo "init:    Install the basics (git,ssh,yay)"
		echo "dots:    Get dot files from gitea and place into ~/git/dot-files"
		echo "stow:    Restore Stow form dots"
		echo "apps:    Use 'yay' to install all thebigowo's applications"
		echo "dwm:     Pulls down thebigowo's dwm build"
		echo "hug:     We all need one sometimes"
		echo " "
		echo "...or just use option 'all' to just do it all in one go ( DO NOT DO THIS )"
		echo " "
		echo "INFORMATION! - options are shown in 'best' order for new install."
	}

init()
	{
		sudo pacman -Sy --needed git openssh
		git clone https://aur.archlinux.org/yay-git.git /tmp/yay-git
		cd /tmp/yay-git
		makepkg -si
	}

dwm()
	{
        echo "Work In Progress"
		#cd ~
		#rm -r dwm
		#mkdir ~/git/dwm
		#git clone gitea@gitea.thebigowo.xyz/julia/dwm.git ~/git/dwm
		#cd git/dwm
		#make clean
		#make
		#sudo make install
	}

hug()
	{
	    clear
	    echo " "
	    title="((((((((( hug )))))))))"
	    printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$title"
	    echo " "
	    echo "everything is going to be okay buddy!"
	    echo " "
	}

dots()
	{
		cd ~
		mkdir ~/git
		git clone gitea@gitea.thebigowo.xyz/julia/dot-files.git ~/git/dot-files
	}

stow()
	{
	    #Remove old MimeTypes list (Because X11 puts it back all the time!)
	    #rm ~/.config/mimeapps.list

	    #setup ~ stow files
	    #sudo rm ~/.config/mimeapps.list &

	    mkdir -p ~/.config/mpv
	    cd ~/git/dot-files/stow_home/
	    stow --restow -vt ~ *


	    #Setup ROOT stow files
	    #cd ~/dots/stow_root; for d in *; do sudo stow -t / $d; done
	}

apps()
	{
		yay -syu $(curl https://gitea.thebigowo.xyz/julia/dot-files/raw/branch/master/pkgs/pacman-pkgs.txt )
		yay -syu $(curl https://gitea.thebigowo.xyz/julia/dot-files/raw/branch/master/pkgs/aur-pkgs.txt )
        pip3 install $(curl https://gitea.thebigowo.xyz/julia/dot-files/raw/branch/master/pkgs/pip-pkgs.txt )
	}

systemd()
    {
        sudo systemctl enable --now $(curl https://gitea.thebigowo.xyz/julia/dot-files/raw/branch/master/systemd/serivces.txt)
    }

syms()
	{
		read -p "Are you sure? THIS WILL DELETE MANY THINGS and symlink them to nextcloud folders [y/N]" -n 1 -r
		echo
		if [[ ! $REPLY =~ ^[Yy]$ ]]
		then
		    exit 1
		fi

		#The "rm"ing
		rm -R ~/{Pictures,Documents,Desktop,Music,Notes,.ssh,Videos,Applications}

        #Nextcloud
        ln -s /mnt/hdd2/Nextcloud ~/Nextcloud

        #Applications
        ln -s ~/Nextcloud/Applications ~/Applications

        # Pictures
		ln -s ~/Nextcloud/Pictures/ ~/Pictures

		#Documents
		ln -s ~/Nextcloud/Documents/ ~/Documents

		#Desktop
		ln -s ~/Nextcloud/Desktop ~/Desktop

		#Downloads
		ln -s ~/Nextcloud/Downloads ~/Downloads

		#Music
		ln -s ~/Nextcloud/Music ~/Music

        #Notes
        ln -s ~/Nextclout/Notes ~/Notes

		#SSH FOLDER!
        #not actually synced (to git) for security reasons!
		ln -s ~/Nextcloud/.ssh/ ~/.ssh
	    chmod 600 ~/.ssh/id_rsa

	    echo "--------------------------------------"
	    echo "You may want to run 'pass init $u' now"
    }

hug
init
dots
stow
apps
systemd
sym
hug
