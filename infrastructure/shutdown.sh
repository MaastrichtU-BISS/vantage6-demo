source ./venv/bin/activate
vnode stop --user -n ortho
vnode stop --user -n fysio
vserver stop --user -n beweeghuis
deactivate

docker volume rm $(docker volume ls -f name=vantage6 -q)
docker volume rm $(docker volume ls -f name=ortho -q)
docker volume rm $(docker volume ls -f name=fysio -q)

rm -R ~/Library/Application\ Support/vantage6/node/fysio
rm -R ~/Library/Application\ Support/vantage6/node/ortho
rm -R ~/Library/Application\ Support/vantage6/server/beweeghuis
