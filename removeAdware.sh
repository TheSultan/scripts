#!/bin/sh
#####################################
# script to remove OS X malware
# based largely on https://support.apple.com/en-us/HT203987
#####################################

## Settings
verbose=false

## Malware dirs
dirs=(\
/System/Library/Frameworks/v.framework \
/System/Library/Frameworks/VSearch.framework \
/Library/PrivilegedHelperTools/Jack \
/Library/InputManagers/CTLoader/ \
/Library/Application Support/Conduit/ \
~/Library/Internet Plug-Ins/ConduitNPAPIPlugin.plugin \
~/Library/Internet Plug-Ins/TroviNPAPIPlugin.plugin \
/Applications/SearchProtect.app \
/Applications/WebTools.app \
/Applications/cinemapro1-2.app \
~/Applications/cinemapro1-2.app \
)

echo "Checking malware dirs to remove"
for dir in "${dirs[@]}"; do 
  if $verbose; then echo "checking if $dir exists" ; fi
  if [ -e $dir ]; then
    echo "Found $dir, deleting"
    rm -rf $dir
  fi
done

echo "Attempting to find and kill Genio and InstallMac"
sudo killall Genieo InstallMac

dirs=(\
/Applications/Genieo \
/Applications/InstallMac \
/Applications/Uninstall Genieo \
/Applications/Uninstall IM Completer.app \
/usr/lib/libgenkit.dylib \
/usr/lib/libgenkitsa.dylib \
/usr/lib/libimckit.dylib \
/usr/lib/libimckitsa.dylib \
/Library/PrivilegedHelperTools/com.genieoinnovation.macextension.client \
~/Library/Application Support/Genieo/ \
~/Library/Application Support/com.genieoinnovation.Installer/ \
# May need to reboot
/Library/Frameworks/GenieoExtra.framework \
# May need to reboot
/Library/LaunchAgents/com.genieo.completer.update.plist \
/Library/LaunchAgents/com.genieo.engine.plist \
/Library/LaunchAgents/com.genieoinnovation.macextension.client.plist \
/Library/LaunchAgents/com.genieoinnovation.macextension.plist \
/Library/LaunchDaemons/com.genieoinnovation.macextension.client.plist \
/Library/LaunchDaemons/Jack.plist \
~/Conduit/ \
~/Trovi/ \
~/Library/Application Support/webHelperApp/ \
~/Library/Caches/com.Conduit.takeOverSearchAssetsMac \
~/Library/Caches/com.VSearch.bulk.installer \
~/Library/Caches/com.VSearch.VSinstaller \
~/Library/cinemapro1-2/ \
~/Library/LaunchAgents/com.genieo.completer.download.plist \
~/Library/LaunchAgents/com.genieo.completer.ltvbit.plist \
~/Library/LaunchAgents/com.genieo.completer.update.plist \
~/Library/LaunchAgents/com.webhelper.plist \
~/Library/LaunchAgents/com.webtools.uninstaller.plist \
~/Library/LaunchAgents/com.webtools.update.agent.plist \
~/Library/LaunchAgents/Safari Security \
~/Library/LaunchAgents/UpdateDownloder \
~/Library/LaunchAgents/WebServerSocketApp \
~/Library/Preferences/com.genieo.global.settings.plist.lockfile \
~/Library/Preferences/com.geneio.settings.plist.lockfile \
~/Library/Preferences/com.geneio.global.settings.plist \
~/Library/Saved Application State/com.genieo.RemoveGenieoMac.savedState \
~/Library/Saved Application State/com.VSearch.bulk.installer.savedstate \
~/Library/WebTools/ \
#TODO: implement everything from the following onwards:
# These next three can have false positives so skipping
#'/Library/LaunchAgents/com.*.agent.plist' \
#'/Library/LaunchDaemons/com.*.daemon.plist' \
#'/Library/LaunchDaemons/com.*.helper.plist' \
# From /Library/Application Support/, remove the
#  file that is the same word used in the LaunchAgents and LaunchDaemons folders,
#  above. Example: midnight.
)

for dir in "${dirs[@]}"; do 
  if $verbose; then echo "checking if $dir exists" ; fi
  if [ -e $dir ]; then
    echo "Found $dir, deleting"
    #rm -rf $dir
  fi
done


