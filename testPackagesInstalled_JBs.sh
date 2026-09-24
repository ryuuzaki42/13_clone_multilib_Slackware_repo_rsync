#!/bin/bash
#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Este programa é um software livre: você pode redistribuí-lo e/ou
# modificá-lo sob os termos da Licença Pública Geral GNU (GPL)
# conforme publicada pela Free Software Foundation, tanto a versão 3
# da licença, como (a seu critério) qualquer versão posterior.
#
# Este programa é distribuído na esperança de que seja útil,
# mas SEM NENHUMA GARANTIA; nem mesmo a garantia implícita de
# COMERCIABILIDADE ou ADEQUAÇÃO A UM PROPÓSITO ESPECÍFICO.
# Consulte a Licença Pública Geral do GNU para mais detalhes.
#
# Script: Script to check if all packages in a folder are installed
#
# Last update: 19/06/2023
#
echo -e "\n # Script to check if all packages in a folder (and subfolders) are installed #\n"

folderWork=$1
if [ "$folderWork" == '' ]; then
    echo "Error: You need pass the folder to work"
elif [ ! -d "$folderWork" ]; then
    echo "Error: The directory \"$folderWork\" not exist"
else
    files=$(find "$folderWork" | grep -E "txz$|tgz$")
    filesName=$(echo "$files" | rev | cut -d '.' -f2- | cut -d '/' -f1 | rev)
    filesName=$(echo "$filesName" | sort)

    echo -e "Packages not installed:\n"
    for pkg in $filesName; do
        locatePkg=$(ls "/var/log/packages/$pkg" 2> /dev/null)

        if [ "$locatePkg" == '' ]; then
            echo "$pkg"
        fi
    done
fi
echo -e "\n # End of the script #\n"
