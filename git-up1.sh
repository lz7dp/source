git config --global user.email "lz7dp@yahoo.com"
git config --global user.name "LZ7DP"

git add *
git commit -m "12.06.2020"
git push origin HEAD:master

echo "# certificate" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/lz7dp/certificate.git
git push -u origin master

