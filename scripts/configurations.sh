echo
echo "Configuring iTerm"
cp files/com.googlecode.iterm2.plist ~/Library/Preferences

echo "Setting up local bin"
(
  cd ~/
  mkdir .bin
  echo 'export PATH="$PATH:~/.bin"' >> .bash_profile
)

echo
echo "Installing vim configuration"
pushd ~/
rm -rf ~/.vim
git clone https://github.com/pivotal/vim-config.git ~/.vim
~/.vim/bin/install
popd

echo
echo "Setting up Pivotal IDE preferences..."
pushd ~/workspace
rm -rf pivotal_ide_prefs
git clone https://github.com/pivotal/pivotal_ide_prefs.git
pushd pivotal_ide_prefs/cli/
./bin/ide_prefs install --ide=intellij
./bin/ide_prefs install --ide=rubymine
popd
popd

