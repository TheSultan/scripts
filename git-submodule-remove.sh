USAGE="Usage: $0 submodule"
if [ "$#" != "1" ]; then
  echo "$USAGE"
  exit 1
fi
asubmodule=$1
echo removing ${asobmudle}
mv ${asubmodule} ${asubmodule}_tmp
git submodule deinit ${asubmodule}    
git rm -f ${asubmodule}
# Note: ${asubmodule} (no trailing slash)
# # or, if you want to leave it in your working tree
# git rm --cached ${asubmodule}
mv ${asubmodule}_tmp ${asubmodule}
# But you seem to still need a:
#
rm -rf .git/modules/${asubmodule}
