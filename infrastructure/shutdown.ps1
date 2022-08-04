.\venv\Scripts\activate
vnode stop -n ortho
vnode stop -n fysio
vserver stop -n beweeghuis
deactivate
Remove-Item -Recurse -Force C:\ProgramData\vantage6\server\beweeghuis*