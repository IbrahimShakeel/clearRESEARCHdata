#!/bin/sh

# kill all open chrome instances gracefully
pkill --oldest chrome

# remove all chrome data related to the given Profile
rm -rf ~/.config/google-chrome/Profile\ 1/
