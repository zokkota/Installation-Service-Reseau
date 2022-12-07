# <u>Rendu 5 : Finalisation et pour aller plus loin.</u>

## A. Finalisation du rapport

Nous avons utilisé pandoc pour réaliser notre rapport final en HTML.

Pour être sur que notre rapport notre rapport final soit bien créé à chaque fois (par exemple, que les modifications potentielles que nous faisont soient prises en compte), nous avons réalisé un script shell qui utilise les commandes pandoc. Il suffit de l'exécuter pour obtenir le rapport final.

Notre fichier `concat.sh` :
> #!/bin/bash  
>  
> pandoc --from gfm --to gfm ./Rendu*.md > RenduFinal.md  
> pandoc --from gfm --to html -s --toc --metadata title="SAÉ 2.03 - Installation Services Réseaux" -c ./RenduFinal/style.css RenduFinal.md > RenduHtml.html

- La première ligne de commande sert à concaténer tous nos rendus (Rendu*.md) dans un seul et même fichier Markdown appelé RenduFinal.md. "gfm" signifie "Github Flavoured Markdown", et est la variante de Markdown que nous utilisons. Nous l'utilisons avec "--from" et "--to" pour indiquer le langage du fichier d'entrée, et de la sortie de la commande.  

  Par défaut, le résultat de la commande pandoc est écrit sur la sortie standard, c'est pourquoi nous utilisons l'opérateur ">" pour rediriger l'entrée standard vers le fichier "RenduFinal.md". Nous obtenons bien un fichier unique contenant tous nos rapports.

- La deuxième ligne de commande est celle qui permet réellement la conversion de Markdown à HTML de nos fichiers.  

  Encore une fois, les deux options "--from" et "--to" permettent d'indiquer le langage d'origine (ici, Github Flavoured Markdown encore une fois), ainsi que le langage de sortie (cette fois-ci, HTML).  

  L'option "-s" est une option qui sert à indiquer que la sortie de la commande devra contenir un entête et un pied de page (en HTML, des balises "header" et "footer"), pour que le fichier soit indépendant (standalone file en anglais, d'où le -s ou --standalone).

  "--toc" est une balise très utile qui sert à générer automatiquement une table des matières ("toc" pour "table of contents") en fonction des différents titres du fichier à convertir. Dans notre cas, la table des matières sera un imbriquement des différents titres de nos fichiers Markdown (précédés par des dièses). Pour que la génération soit réussie, il faut que tous les fichiers concaténés suivent les même règles de titrage, ce que nous avons respecté dans tous nos rapports.  

  L'option "--metadata" permet d'ajouter des méta-données à notre document. Pour un fichier HTML, il est recommandé d'indiquer le titre de la page pour que pandoc puisse l'utiliser lors de la génération, ce que nous avons fait.  
  Dans le cas où il y aurait beaucoup de méta-données, la commande pourrait être très longue à force de lister toutes les données (mdr), on peut donc également utiliser "--metadata-file" pour fournir un fichier YAML ou JSON contenant les données, que pandoc lira et intégrera à la génération.

  Enfin, l'option "-c" permet d'inclure un fichier CSS que pandoc liera à l'HTML généré.

  Nous avons également ajouté l'option -S (pour "smart") qui sert à convertir certains caractères dans leur forme correcte, ains que l'option "--self-contained" qui permet d'inclure tous les fichiers externes (images, feuilles de style, etc...) dans un seul unique fichier HTML sans aucune dépendances.

  Nous renseignons ensuite le fichier source, puis nous redirigons le résultat de la commande pandoc (qui, je le rappel, produit un résultat sur la sortie standard) vers le fichier RenduHtml.html avec l'opérateur ">".

En concaténant tous les fichiers Markdown de nos rapports à un seul, puis en le convertissant grâce à pandoc et plusieurs options, nous obtenons un fichier HTML final, qui ne demande plus qu'à être stylisé à l'aide de quelques règles CSS.

Nous avons ajouté une ou deux balises au fichier HTML pour avoir une meilleure page de présentation, le reste a été laissé intact.
