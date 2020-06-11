@echo off
rem Cheridan asked for this. - N3X
call py ss13_genchangelog.py ../../html/changelog_drex.html ../../html/changelogs
pause
git commit -m "Automatic Changelog Update" -a
git push
pause