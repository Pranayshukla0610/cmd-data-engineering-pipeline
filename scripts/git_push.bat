@echo off

git init
git add .
git commit -m "Complete CMD Data Engineering Pipeline"

git branch -M main

git remote add origin https://github.com/YOUR_USERNAME/cmd-data-engineering-pipeline.git

git push -u origin main