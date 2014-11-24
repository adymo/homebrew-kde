Alexander Dymo's Homebrew
=========================
Homebrew tap to build KDE apps on Mac OS. Based on https://github.com/somekool/homebrew but actually works. Note, this is not a full KDE distribution. It contains only KDE apps that this project's maintainers actually use.

Available stable apps:
- KDevelop
- Kate
- Konversation
- Massif Visualizer

Experimental apps:
- Calligra

Installation
------------

Prepare your environment:

* Append these codes to your `~/.bash_profile` or `~/.profile`:

```
export KDEDIRS=$KDEDIRS:$HOME/Library/Preferences/KDE:/usr/local/kde4
export PATH=/usr/local/kde4/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/kde4/lib:$DYLD_LIBRARY_PATH
launchctl setenv DYLD_LIBRARY_PATH /usr/local/kde4/lib:$DYLD_LIBRARY_PATH
export XDG_DATA_HOME=$HOME/Library/Preferences/KDE/share
export XDG_DATA_DIRS=/usr/local/kde4/share:/usr/local/share:/usr/share
```
* If you were using this tap before Feb 17, 2014, kde stuff were installed to `/usr/local` and you cannot uninstall them. Which means your `/usr/local` is already messed up. Please backup everything important, `sudo rm -rf /usr/local/*`, reinstall homebrew and all your formulas, and anything else you put under `/usr/local`.
* Now kde stuff are installed to `/usr/local/kde4`, you still cannot uninstall single kde formula, but you can safely nuke that directory and reinstall kde formulas you want to keep. 
* We're working on a solution to make kde formulas install to their own kegs.

Tap my KDE repository:

`brew tap adymo/kde`

Compile Qt with D-Bus and Qt3 support. KDE will not work without that.

```
brew uninstall qt
brew install qt --with-d-bus --with-qt3support
```

Install KDE applications

```
brew install kate
brew install kdevelop
brew install kdevelop-ruby
brew install ...
```

Launch D-Bus

```
mkdir -p ~/Library/LaunchAgents
# substitute Cellar/d-bus/1.8.0 below with your actual dbus installation dir
ln -s /usr/local/Cellar/d-bus/1.8.0/org.freedesktop.dbus-session.plist ~/Library/LaunchAgents
launchctl load -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist
```

Update system configuration:

* relogin or restart your system

```
kbuildsycoca4 --noincremental
update-mime-database /usr/local/share/mime
update-mime-database /usr/local/kde4/share/mime
```

Create application links (so that Finder and Launchpad see KDE apps):

```
brew linkapps
```

Run KDE apps from Launchpad or from command line:

```
open /Applications/kdevelop.app
```

Troubleshooting
---------------

* if kbuildsycoca4 never finishes, then stop dbus, remove its lock file (run `env | grep DBUS` to find out where it is) and start dbus again
* if dbus fails to start, check whether you have `/usr/local/etc/dbus-1/session.d` directory
* sometimes after App Store run upgrades, `DYLD_LIBRARY_PATH` will be reset, then some plugins will fail to load, run `launchctl setenv DYLD_LIBRARY_PATH /usr/local/kde4/lib:$DYLD_LIBRARY_PATH` in terminal to fix
* if kbuildsycoca or any other KDE app hangs during start, upgrade d-bus or recompile dbus from sources (installations from bottles was broken at some point, it was missing important configuration files): `brew uninstall dbus && brew install dbus --build-from-source`
* if grantlee fails to download because of sha mismatch, try `brew install --HEAD grantlee`

