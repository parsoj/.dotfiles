#!/usr/bin/env bash

rm -rf ~/.zshrc ; ln -s $(pwd)/zshrc ~/.zshrc
rm -rf ~/.zshenv ; ln -s $(pwd)/zshenv ~/.zshenv

#rm -rf ~/.bashrc ; ln -s $(pwd)/bashrc ~/.bashrc
#rm -rf ~/.bash_profile ; ln -s $(pwd)/bash_profile ~/.bash_profile
