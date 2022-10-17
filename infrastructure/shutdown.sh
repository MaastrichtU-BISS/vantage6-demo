source ./venv/bin/activate
vnode stop --user -n ortho
vnode stop --user -n fysio
vserver stop --user -n beweeghuis
deactivate

rm -R ~/Library/Application\ Support/vantage6/node/fysio
rm -R ~/Library/Application\ Support/vantage6/node/ortho
rm -R ~/Library/Application\ Support/vantage6/server/beweeghuis
