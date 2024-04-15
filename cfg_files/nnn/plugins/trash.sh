#!/bin/sh

selection="$HOME/.config/nnn/.selection"

printf "\n" >> $selection
# interate through .selection file and move  to ~/.trash
tr '\0' '\n' < $selection | while read -r file ; do
    mv "$file" $HOME/.trash/
done

rm $selection



