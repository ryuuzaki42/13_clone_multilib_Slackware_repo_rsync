## clone_multilib_Slackware_repo_rsync
Clone Slackware multilib mirror to a local folder using rsync

#### Use:
```sh
$ ./clone_Slackware_multilib_rsync_JBs.sh
```

#### You can chose:
* the **mirror source**, the default is **rsync://rsync.slackware.org.uk/people/alien/multilib**
* the **Slackware version** (e.g., **14.2**, **15.0**, **current**)
* with **md5 check** or not

### Enabling multilib # After the clone - download \#

#### * This procedure will also work if you already had a multilib setup and have upgraded your Slackware to a newer release (new compat32 packages will be installed and existing ones will be upgraded).

1 Open the terminal as root in the downloaded folder (e.g. 15.0)

2 You will need upgrade your 64bit Slackware gcc and glibc packages to their multilib versions by running the command below as root. This also install a new package called "compat32-tools"
```sh
# upgradepkg --reinstall --install-new *.t?z
```

3 Now you need to install 32-bit compatibility packages to support all the 32-bit programs you may want to run.
```sh
# upgradepkg --install-new slackware64-compat32/*-compat32/*.t?z
```

4 You need to reboot because of the glibc upgrade.
Done : D!

#### You can test if the all packages was installed/upgraded
> In a update of multilib, for example, or just for test. Change "Version" for the version you want to test
```sh
$ testPackagesInstalled_JBs.sh Version
```
