. ./venv/bin/activate
v6 node stop --user -n ortho
v6 node stop --user -n fysio
v6 node stop --user -n third
v6 server stop --user -n beweeghuis
deactivate

docker stop vantage6-ui

# docker volume rm $(docker volume ls -f name=vantage6 -q)
# docker volume rm $(docker volume ls -f name=ortho -q)
# docker volume rm $(docker volume ls -f name=fysio -q)

# Optional: delete images
# docker rmi -f $(docker image ls --filter=reference='harbor*/*/*' -q)

# #macOS
# rm -R ~/Library/Application\ Support/vantage6/node/fysio
# rm -R ~/Library/Application\ Support/vantage6/node/ortho
# rm -R ~/Library/Application\ Support/vantage6/server/beweeghuis

# Linux
rm -Rf ~/.local/share/vantage6/node/fysio
rm -Rf ~/.local/share/vantage6/node/ortho
rm -Rf ~/.local/share/vantage6/node/third
rm -Rf ~/.local/share/vantage6/server/beweeghuis
rm -Rf ~/.cache/vantage6
