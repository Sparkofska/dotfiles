cp ~/.vimrc .
cp ~/.tmux.conf .

git add *
git status

# let user confirm
read -p "Commit? [y, n] " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  git commit -m "auto commit"
  git push
fi
