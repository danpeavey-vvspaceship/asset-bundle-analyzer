 #!/bin/bash 

# My memory is shit so here's what I looked up to write this in 5 minutes.
# 1. https://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-5.html
# 2. https://devconnected.com/how-to-check-if-file-or-directory-exists-in-bash/
# 3. https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SCRIPTFILE="$SCRIPTPATH/analyzer.py"
TOOLS_PATH="/Applications/Unity/Hub/Editor/2019.2.14f1/Unity.app/Contents/Tools"

if [[ ! -f "$SCRIPTFILE" ]];
then
    echo "Cannot find analyzer.py... aborting."
    exit 1
fi 

if [[ ! -d "$TOOLS_PATH" ]];
then
    echo "Script may be out of date. Ensure the Unity Tools path is still current."
    exit 1
fi

python3 "$SCRIPTFILE" -r -k "$TOOLS_PATH" "$1"