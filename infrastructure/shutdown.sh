. ./venv/bin/activate
v6 node stop --user -n gamma
v6 node stop --user -n beta
v6 node stop --user -n alpha
v6 server stop --user -n demoserver
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
rm -Rf ~/.local/share/vantage6/node/alpha
rm -Rf ~/.local/share/vantage6/node/beta
rm -Rf ~/.local/share/vantage6/node/gamma
rm -Rf ~/.local/share/vantage6/server/demoserver
rm -Rf ~/.cache/vantage6
