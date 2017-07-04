## clone_multilib_Slackware_repo
Clone Slackware multilib mirror to a local folder
____
#### Default mirror: http://bear.alienbase.nl/mirrors/people/alien/multilib/
____
#### Usage:
``` ./clone_Slackware_multilib_JBs.sh ```
____
### Enabling multilib # After the clone - download \#
#### * This procedure will also work if you already had a multilib setup and have upgraded your Slackware to a newer release (new compat32 packages will be installed and existing ones will be upgraded).
____
1 Go to the downloaded folder (e.g. 14.2)
____
2 You will need upgrade your 64bit Slackware gcc and glibc packages to their multilib versions by running the command below as root. This also install a new package called "compat32-tools".
\#upgradepkg --reinstall --install-new \*.t?z
____
3  Now you need to install 32-bit compatibility packages to support all the 32-bit programs you may want to run.
\# upgradepkg --install-new slackware64-compat32/\*-compat32/\*.t?z
____
4 You need to reboot because of the glibc upgrade.
Done!
