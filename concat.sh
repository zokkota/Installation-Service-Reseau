#!/bin/bash

pandoc --from gfm --to gfm ./Rendu*.md > RenduFinal.md
pandoc --from gfm --to html -s --toc --metadata title="SAÉ 2.03 - Installation Services Réseaux" -c ./RenduFinal/style.css --self-contained RenduFinal.md > RenduHtml.html