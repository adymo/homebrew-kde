Alexander Dymo's Homebrew
=========================
Homebrew tap to build KDE apps on Mac OS. Based on https://github.com/somekool/homebrew but actually works. Note, this is not a full KDE distribution. It contains only KDE apps that this project's maintainers actually use.

Available apps: KDevelop, Kate, Calligra, Konversation

You can tap this repository to your existing homebrew with "brew tap adymo/kde".

Installation
------------

Prepare your environment:

* prepend /usr/local/bin to your PATH in ~/.bash_profile (note, it's important that your setting extends $PATH, not replaces it, otherwise things will not compile with strange errors)  
  <code>export PATH=/usr/local/kde4/bin:$PATH</code>
* . ~/.bash_profile
* If you've used this tap before Feb 17, 2014, those kde stuff were installed to /usr/local and uninstallable. Your best choice would be make a backup to homebrew and everything else installed to /usr/local, nuke everything in /usr/local directory and reinstall homebrew and everything else. Sorry for the inconvenience. Currently all kde stuff installed to /usr/local/kde4 so in future you just need to nuke that directory when uninstall. We're working on a solution to install kde formulas to their own kegs.

Tap my KDE repository:

* brew tap adymo/kde

Compile Qt with D-Bus and Qt3 support if you haven't done that before.

* brew uninstall qt
* brew install qt --with-d-bus --with-qt3support

Install KDevelop, Kate and (optionally) additional language support plugins

* brew install kdevelop
* brew install kdevelop-ruby
* brew install kate

Launch D-Bus

* mkdir -p ~/Library/LaunchAgents
* ln -s /usr/local/opt/d-bus/org.freedesktop.dbus-session.plist ~/Library/LaunchAgents/
* launchctl load -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist

Update system configuration:

* restart your system (optional, but helps prevent various dbus-related problems)
* kbuildsycoca4 --noincremental
* update-mime-database /usr/local/kde4/share/mime

Create application links (so that Finder and Launchpad see KDevelop and Kate apps):

* brew linkapps

Run KDevelop and Kate from Launchpad or from command line:

* open ~/Applications/kdevelop.app
* open ~/Applications/kate.app

Troubleshooting
---------------

* if kbuildsycoca4 never finishes, then stop dbus, remove its lock file (run "env | grep DBUS" to find out where it is) and start dbus again
* if dbus fails to start, check whether you have /usr/local/etc/dbus-1/session.d directory
* if something does not compile, make sure you do not override $PATH in .bash_profile, but rather prepend /usr/local/kde4/bin to it like this:  
  <code>export PATH=/usr/local/kde4/bin:$PATH</code>
