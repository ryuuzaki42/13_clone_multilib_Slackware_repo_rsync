#!/bin/bash
#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Criticas "construtivas"
# me envie um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Este programa é um software livre; você pode redistribui-lo e/ou
# modifica-lo dentro dos termos da Licença Pública Geral GNU como
# publicada pela Fundação do Software Livre (FSF); na versão 2 da
# Licença, ou (na sua opinião) qualquer versão.
#
# Este programa é distribuído na esperança que possa ser útil,
# mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO a
# qualquer MERCADO ou APLICAÇÃO EM PARTICULAR.
#
# Veja a Licença Pública Geral GNU para mais detalhes.
# Você deve ter recebido uma cópia da Licença Pública Geral GNU
# junto com este programa, se não, escreva para a Fundação do Software
#
# Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
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
