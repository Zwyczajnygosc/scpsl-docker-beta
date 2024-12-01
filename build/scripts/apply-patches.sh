#! /bin/bash

echo -ne "Applying Patches"
echo -ne '[                         ] (0%)\r\c'

dpkg -i /libicu63_63.1-6+deb10u3_amd64.deb
echo -ne '[#########################] (100%)\r\c'