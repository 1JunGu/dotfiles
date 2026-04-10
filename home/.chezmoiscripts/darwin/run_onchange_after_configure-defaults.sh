#!/bin/bash

set -eufo pipefail

defaults write -g AppleShowAllExtensions -int 1                              #show file extensions

defaults write -g com.apple.swipescrolldirection -bool false                 #disable natural scrool direction
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true         #enable tab-to-click for the trackpad
defaults write com.apple.mouse.tapBehavior -int 1                            #show the correct state in system preferences

defaults write com.apple.dock autohide -int 1                                #auto hide dock
defaults write com.apple.dock show-recents -int 0                            #don't show recently used apps

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true #disable the .DS file creation
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true     #

defaults write com.apple.finder "ShowPathbar" -bool true                     #show the path bar in Finder
defaults write com.apple.finder "AppleShowAllFiles" -bool true               #show hidden files
defaults write com.apple.finder "_FXSortFoldersFirst" -bool true             #keep folders on the top on Finder

defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool true    #keep folders on the top on Desktop

killall Dock
killall Finder
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u #apply the settings

