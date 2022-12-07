<h1 style="text-align: center;">S2.03 Installation de Services Réseaux</h1>

## Rendu 1 : Préparation d'une machine virtuelle Debian

### A. Notre avancement dans l'installation

Nous n'avons pas rencontré de difficultés particulières lors de l'installation de la machine virtuelle. Nous l'avons chacun installé de notre côté pour pouvoir réaliser chaque tâche et comprendre les mécanismes de la machine virtuelle, tout en nous mettant d'accord lorsqu'il y a des choix techniques à réaliser.

<!-- <figure>
    <img style="width:75%;height:auto;" src="./Rendu1-res/specifications.png" alt="Spécificité d'une machine">
    <figcaption>
        Spécificité d'une des machines et l'environnement de bureau MATE installé
    </figcaption>
</figure> -->
![Spécificité d'une machine](./Rendu1-res/specifications.png)<!--{ width=50% } -->
*Spécificité d'une des machines et l'environnement de bureau MATE installé*

### B. Réponses aux questions

- #### <u>Q1: Quelle est la configuration réseau utilisée par défaut ?</u>

La configuration réseau par défaut de la machine invitée est NAT, ou Network Address Translation. C'est la configuration la plus simple pour que l'invité puisse accéder aux réseaux externes. La machine virtuelle peut communiquer avec Internet ou d'autres réseaux à travers un router, qui est dans ce cas le "VM VirtualBox networking engine" placé entre l'invité et l'hôte.  

Le VM VirtualBox NAT engine reçoit les paquets de la machine invitée, extrait les données de la trame TCP/IP, et l'envoie au système hôte. Pour les autres machines, c'est comme si les données avaient été envoyées de l'application "VM VirtualBox" de la machine hôte avec l'adresse IP de la machine hôte, et non pas de la machine invitée comme c'est le cas. L'engine écoute les réponses aux paquets envoyés, extrait les données et les renvoie vers la machine invitée.  

![Configuration réseau de notre machine](./Rendu1-res/network-settings.png)  
*Exemple : configuration de notre machine depuis VM VirtualBox*

> Référence : <https://www.virtualbox.org/manual/ch06.html>

### <ins>Q2: Quel est le nom du fichier XML contenant la configuration de votre machine ?</ins>

Le fichier XML qui contient la configuration de la machine se nomme `sae203.vbox-pre`  
Il a un emplacement différent selon le système d'exploitation de la machine hôte, sur Windows dans `$HOME\VirtualBox VMs\sae203\sae203.vbox-prev`  
Par ailleurs, on peut trouver le fichier de configuration globale de VM VirtualBox dans `$HOME\.VirtualBox\VirtualBox.xml` (sur Windows encore une fois)

> Référence : <https://docs.oracle.com/en/virtualization/virtualbox/6.0/admin/vboxconfigdata.html>  
<https://www.virtualbox.org/manual/ch08.html#vboxmanage-guestproperty>

### <ins>Q3: Qu’est-ce que la RAM ?</ins>

La RAM (de l'anglais 'random access memory', souvent traduit en français par 'mémoire vive') est un espace de stockage de données temporaire et rapide. L'ordinateur stocke dans la RAM les données auxquelles il devra avoir accès immédiatement ou très rapidement, à l'inverse d'un disque dur qui stocke les données plus lentement mais plus durablement.

![RAM alouée](./Rendu1-res/ram-alocated.png)  
*Exemple : RAM alouée à notre machine depuis VM VirtualBox*

### <ins>Q4: Qu’est-ce que signifie “64-bits” dans “Debian 64-bit” ?</ins>

64 bits correspond à la taille des mots binaires manipulés par le processeur.  
Là où un système 32 bits ne peut adresser au maximum une mémoire d'uniquement 2<sup>32</sup> (=4Gio, ~4Go), le système 64 bits peut adresser des mémoires jusqu'à 2<sup>64</sup> (=16Eio*, =Enormément de mémoire ~1.84x10<sup>10</sup>).  
En pratique il permet donc d'utiliser plus de 4Go de RAM (~3.5Go en pratique) pour sa machine.  

*Eio = Exbioctet = 2<sup>60</sup> octets

### <ins>Q5: Qu’est-ce qu’un fichier iso bootable ?</ins>

Un fichier iso est une représentation, l'image d'un disque à l'identique.
Ce format est très utilisé pour partager des fichiers d'installation, en particulier ceux de systèmes d'exploitation car il permet de rassembler tous les fichiers, en conservant leur ordre d'origine, dans un seul et même fichier.
Un ISO est une archive, il est donc moins lourd que l'ensemble des fichiers originals.

Bootable veut dire que l'ordinateur pourra démarrer à partir de cette image ISO, "gravée" sur un support (CD, USB, DD) lui même inséré dans la machine.

### <ins>Q6: Qu’est-ce que MATE ? GNOME ?</ins>

MATE et GNOME (acronyme de 'GNU Network Object Model Environment') sont des environnements de bureau. Ils permettent d'utiliser un ordinateur grâce à une interface utilisateur graphique (GUI en anglais).  
Ce sont des ensembles de programmes qui aident l'utilisateur à accéder et gérer les fichiers, tout en faisant l'impasse sur certaines fonctionnalités plus spécifiques de l'ordinateur.  
Ces environnements de bureau sont souvent un ensemble d'icônes, de fenêtres, et souvent un bureau, qui permettent des interactions humain-machine.
L'utilisation d'environnement de bureau se fait au détriment des performances maximales de la machine, celle-ci utilisant des ressources pour l'affichage graphique.
Sans environnement de bureau, l'ordinateur ne serait utilisable qu'en lignes de commandes, et serait donc beaucoup moins accessible au grand public.

![MATE sur notre machine](./Rendu1-res/mate.png)
*Exemple : l'environnement de bureau MATE installé sur notre machine*

> Référence : <https://en.wikipedia.org/wiki/Desktop_environment>

### <ins>Q7: Qu’est-ce qu’un serveur web ?</ins>

C'est un serveur informatique qui répond à des requêtes du World Wide Web sur un réseau public ou privé, en utilisant principalement le protocole HTTP.  

Un serveur web est soit un logiciel (serveur HTTP pour les ressources web), soit un serveur informatique (ordinateur) qui répond à des requêtes de la toile.
Un serveur web utilise principalement le protocole HTTP (Hypertext Transfer Protocol) ou sa variante sécurisée HTTPS (HTTP Secure) pour répondre aux requêtes de clients. Ces requêtes varient et changent la nature des échanges entre le client et le serveur. Par exemple, la méthode GET permet au client de recevoir une ressource demandée, alors que la méthode POST va envoyer des données à une ressource du serveur qui devra les traiter. A chaque fois que le client reçoit une réponse du serveur, elle est accompagné d'un code qui indique comment s'est passé l'échange (par exemple, `200 OK` indique que tout s'est déroulé comme prévu, alors qu'un code de la forme `4XX` indique qu'une erreur est survenue. Parmis les plus connues, `404 Not Found` indique que la ressource n'a pas été trouvée, ou encore `418 I'm a teapot` indique que le serveur est une théière).

Un serveur web peut également gérer l'envoi et la réception d'emails grâce à différents protocoles : SMTP (Simple Mail Transfer Protocole) qui est le protocole utilisé pour envoyer les mails entre serveurs, et POP3 (Post Office Protocol) et IMAP (Internet Message Access Protocol) pour récuper les mails du serveur vers le client. POP3 transfert les mails du serveur au client, alors qu'IMAP les copie.

Enfin, un serveur web peut emettre des flux de diffusion, héberger une base de données ou encore assurer le transfert de fichiers (File Transfer Protocol, FTP).

> Références : [HTTP](https://datatracker.ietf.org/doc/html/rfc7231)  
[HTCPCP](https://datatracker.ietf.org/doc/html/rfc2324)  
[SMTP](https://datatracker.ietf.org/doc/html/rfc8314)  
[IMAP](https://datatracker.ietf.org/doc/html/rfc9051)  
[FTP](https://datatracker.ietf.org/doc/html/rfc959)

### <ins>Q8: Qu’est-ce qu’un serveur ssh ?</ins>

SSH (secure shell) est un protocole pour sécuriser la connexion entre deux ordinateurs à distance à travers un réseau non sécurisé en encryptant les communications.  
Le protocole SSH fonctionne sur un modèle client/serveur. Une machine (client) qui souhaite se connecter à une autre (hôte) va envoyer une requête qui va être traitée par le serveur SSH de cet hôte.  

Pour ce qui est du fonctionnement de ce protocole, il y a tout d'abord une phase de connexion : le serveur SSH va transmettre au client sa clé publique, preuve que le client communique avec la bonne machine (et non pas un possible pirate qui essayerais d'intercepter la communication).  
Si l'authentification réussie, la machine hôte va donner au client l'accès au système avec les permissions du compte avec lequel il s'est connectée.  
Cette connexion sécurisée peut être utilisée pour de l'administration, de l'exécution de commande, et des transferts de fichiers (SFTP, une version sécurisé du File Transfer Protocole) à distance, parmis beaucoup d'autres utilisations.

> Référence : <https://www.ssh.com/academy/ssh/protocol>

### <ins>Q9: Qu’est-ce qu’un proxy (ou serveur mandataire) ?</ins>

Un proxy (serveur mandataire) est quelque chose qui joue le rôle d'intermédiaire entre 2 hôtes pour faciliter et/ou surveiller les échanges.  
C'est un entremetteur qui relaie les requêtes entre deux fonctions, l'une cliente l'autre serveur.  

Un proxy est souvent utilisé comme interface entre un réseau privé et Internet (comme c'est le cas à l'université par exemple). Les machines du réseau privé communiquent d'abord avec le proxy qui va traiter l'information et l'envoyer vers le serveur pour lequel la requête était réellement destiné. Lorsque le proxy reçoit les potentielles réponses, il les renvoie vers la machine du réseau qui avait envoyé une requête. Il n'y a donc pas de communication directe entre le client et le seveur.  

Ainsi, toutes les communications du réseau passent par ce proxy, ce qui permet de sécuriser les communications, de filtrer des requêtes indésirables, de créer un historique des requêtes, parmis d'autres avantages plus techniques.  
De plus, l'accès à des ressources via un proxy permet de contourner certaines règles gouvernementales dans les pays où Internet est censuré, car le proxy fait la requête à la ressource demandée à la place de l'utilisateur.  
Enfin, il existe des proxys à utilisation plus spécifique, comme un proxy DNS qui fait le relais direct en transmettant les requêtes DNS vers un DNS, et peut aussi les mettre en mémoire cache pour les réutiliser.

> Référence : <https://en.wikipedia.org/wiki/Proxy_server>
<h1 style="text-align: center;">S2.03 Installation de Services Réseaux</h1>

## <u>Rendu 2 : Préparation du système</u>

## A. Notre avancement dans l'installation

- Il n'y avait pas de décisions à prendre cette semaine pour le rendu, nous avons tous suivi les étapes de la préparation du système sur nos machines virtuelles en préparation des installations futures.
- Nous avons installé les différents paquets demandés dans l'énoncé, en plus de certains autres pour améliorer notre confort d'utilisation du système (comme pas exemple VSCodium).

  ![Paquets installés](./Rendu2-res/installed.png)
  *Quelques paquets que nous avons installé (liste non exhaustive)*

- Nous avons bien installé les suppléments invités sur chacunes des machines en utilisant la commande `mount` sur le CDRom.
- Finalement, nous avons exporté notre machine virtuelle au format `.ova` pour pouvoir redémarrer une installation proprement au cas où un problème venait à survenir dans le futur.

## B. Réponses aux questions

### <u>Q1: Comment peux-t-on savoir à quels groupes appartient l'utilisateur *user* ?</u>

Pour savoir à quel(s) groupe(s) appartient un utilisateur, on peut utiliser la commande `groups` en ligne de commande.  
L'utilisation de la commande sans aucun argument affiche le(s) groupe(s) dans le quel l'utilisateur qui execute la commande se trouve.  

Pour connaître les groupes d'autres utilisateurs (par exemple, si on est connecté en tant que *root* et qu'on veut savoir à quels groupes appartient *user*, dans le cadre d'administration du système), il suffit d'ajouter le nom de l'utilisateur en argument, et tous les groupes de cet utilisateur seront affichés.

![Utilisation de groups](./Rendu2-res/groups-usage.png)  
*Utilisation de `groups` connecté en tant que root*

> Référence : <https://www.man7.org/linux/man-pages/man1/groups.1.html> ou `man groups` en ligne de commande.

### <u>Q2: À quoi servent les paquets installés ?</u>

De nombreux paquets ont installés lors de cette étape. Voici un récapitulatif de ce qu'il font :

- `xterm` : émulateur de terminal.
- `vim` : "VI Improved", un éditeur de texte en ligne de commande.
- `curl` : outil qui permet de transferrer des données depuis ou vers un serveur en utilisant une URL, et qui supporte un grand nombre de protocoles.
- `git` : outil de gestion de versions décentralisés.
- `sqlite3` : gestion d'une base de donnée sqlite en ligne de commande.
- `build-essential` : ensemble de paquets qui sont nécessaires à la création de fichier .deb (Debian Linux Package File). Ces paquets sont :

  - `libc` : librairie standard C
  - `gcc` : collection de compilateurs de C et C++
  - `g++` : un compilateur de C
  - `make` : utilitaire pour compiler un fichier C et/ou un projet C en exécutable.
  - `dpkg-dev` et `hurd-dev`

  Exécuter la commande `sudo apt install build-essential` revient à installer tous ces paquets un à un (déconseillé car ces paquets ont des dépendances les uns envers les autres, il est donc conseillé de les installé dans le cadre de build-essential pour éviter des problèmes de dépendances).
- `dkms` : accronyme de 'Dynamic Kernel Module Support', c'est un environnement qui permet l'installation de versions supplémentaires des modules du noyau Linux.
- `linux-headers` : fichiers C qui contiennent de nombreuses fonctions et définitions de structures permettant de compiler des modules du noyau.

De manière générale, on peut penser que l'ensemble des paquets installés ont pour but de mettre en place un environnement de développement en C.

> Références :  
>
> - `man xterm`  
> - `man vim`  
> - `man curl`  
> - `man git`  
> - `man sqlite3`  
> - liste des paquets fournis avec build-essential trouvable dans `/usr/share/build-essential/list`  
> - `man libc`  
> - `man gcc`
> - `man make`  
> - `man dksm`  

### <u>Q3: Quel est le noyaux Linux utilisé par votre VM ? Comment l'avez vous trouvé ?</u>

La commande `uname` nous permet d'avoir des informations sur le système. Utilisé avec l'option -r, on peut optenir la révision du noyaux Linux utilisé par le système. En plus de ça, on peut optenir la version du noyau et la date de mise à jour avec l'option -v.

![utilisation de uname](./Rendu2-res/uname.png)  
*Affichage des spécificités de la machine avec uname*

> Référence : <https://www.man7.org/linux/man-pages/man1/uname.1.html> ou `man uname`

### <u>Q4: À quoi servent les suppléments invités ? Donner 2 principales raisons de les installer</u>

Les suppléments invités sont des drivers ou des applications installés sur la machine invitée pour optimiser les performances et la stabilité du système. De plus, ils offrent de nombreuses fonctionnalités qui permettent de faciliter le travail entre la machine hôte et la machine invitée.  

Installer ces suppléments est utile car :

- Ils permettent de faciliter les communications entre l'hôte et l'invité, ce qui permet de contrôler et de surveiller la machine virtuelle depuis la machine physique. Cela permet également d'envoyer des données entre les deux machines (dans les deux sens). Pour permettre cela, VirtualBox établit un canal de communication privé entre l'hôte et l'invité, et les deux peuvent alors envoyer des données dans un sens ou dans l'autre. Ce mécanisme permet également d'obtenir des données sur le système invité, comme le système d'exploitation exact, la version de l'installation des suppléments invités, les utilisateurs qui sont connectés sur le système invité, des statistiques sur les connexions réseaux de la machine, parmis d'autres fonctionnalités.
- Ils permettent de faciliter l'utilisation de la machine virtuelle grâce à plusieurs fonctionnalités : changement de résolution automatique en fonction de la taille de la fenêtre, partage de fichiers et du presse-papier entre les deux machines, et meilleure intégration du pointeur de la souris.

La liste complète des différents suppléments invités installés sur une machine peut être obtenue en utilisant la commande `guestproperty` de `VBoxManage` sur la machine physique.

![utilisation de guesproperty](./Rendu2-res/guestproperty.png)
*Enumération des suppléments invités installés sur une machine*

> Référence : <https://www.virtualbox.org/manual/ch04.html>  
<https://www.virtualbox.org/manual/ch08.html#vboxmanage-guestproperty>

### <u>Q5: À quoi sert la commande `mount` (dans notre cas de figure et dans le cas général) ?</u>

- Dans le cas général :  
    La commande `mount` permet d'attacher une partie du système de fichier choisie au système de fichier global de Linux (qui commence par la root /). Cette commande est très utile, surtout dans le cas où le système de fichier est répandu sur plusieurs machines ou à travers un réseau.  
    La configuration de base de la commande `mount` peut être trouvée et modifiée dans le fichier <u>/etc/fstab</u>. Ce fichier précise, lorsque que la commande ne le fait pas, où les fichiers sont généralement attachés et avec quelles options. Cette configuration sera utilisée lorsque la commande `mount -a` sera executée. En revanche, si l'appareil et le dossier cible sont spécifiés, la commande ne fera pas appel à ce fichier.

- Dans notre cas de figure :  
    La première commande `sudo mount /dev/cdrom /mnt` a attaché tous les dossiers et fichiers se trouvant dans /dev/cdrom au dossier /mnt du système de fichier de la machine. L'appareil (/dev/cdrom) et le dossier cible (/mnt) on été spécifiés, il n'y a donc pas d'options autres que celles spécifiés par la commande (c'est à dire aucune).  
    Puis, `sudo /mnt/VBoxLinuxAdditions.run` a exécuté le fichier VBoxLinuxAdditions.run, qui se trouve maintenant dans notre architecture de fichier.

![Exemple avec WSL](./Rendu2-res/wsl-example.png)  
*Exemple d'utilisation commune de la commande mount avec WSL (Windows Subsystem for Linux) : utilisation de l'architecture de fichier basique de Linux (avec / comme racine), à laquelle l'archtecture de fichier Windows (avec C: comme racine) est attachée avec mount*

> Référence : <https://www.man7.org/linux/man-pages/man8/mount.8.html> ou `man 8 mount`
<h1 style="text-align: center;">S2.03 Installation de Services Réseaux</h1>

## <u>Rendu 3 : Sélection d'un frontend</u>

## A. Notre avancement dans l'installation

Pour cette étape :

- Nous avons bien paramétré git comme indiqué dans l'énoncé.

![Configuration git](./Rendu3-res/gitconfig.png)<br>
*Configuration d'une machine pour utilisation de git.*

- Nous avons installé les deux paquets gitk et git-gui.

![Gitk et git-gui installé](./Rendu3-res/gitk-gitgui.png)<br>
*Gitk et git-gui sont installé sur le serveur.*

- Nous avons choisi GitUI comme interface graphique. [Voir réponses aux questions concernant GitUI.](#uq3-pourquoi-avez-vous-installé-ce-logiciel-u)

![utilisation de gitgui](./Rendu3-res/gituiutilisation.png)<br>
*Interface principale de GitUI, directement sur le terminal.*

## B. Réponses aux questions

### <u>Q1: Que sont les deux logiciels gitk et git-gui ?</u>

- gitk permet de naviguer sur un dépôt git. L'utilisation de la commande gitk permet de visualiser plusieurs informations :

  - Les changements entre deux commits (ou entre HEAD et un commit)
  - Un graph représentant l'historique des commits et les fusions de branches.
  - Des informations spécifiques sur un commit : date, numéro, commentaires, auteur des modifications (git blame)

![Utilisation de gitk sur notre projet de dev](./Rendu3-res/gitk-interface.png)<br>
*Utilisation de gitk sur notre projet de développement S2.01-S2.02 : visualisation de changements récents et graphe des changements.*

- git-gui : c'est une interface graphique de Git (GUI = Graphical User Interface). Celle-ci permet de faire des changements sur le dépôt en créant de nouveaux commits, d'indexer les modifications, de créer de nouvelles branches, de fusionner des branches locales, et permet également de push ou pull les modifications vers/depuis le dépôt.

![Utilisation de gitgui sur notre projet de dev](./Rendu3-res/git-gui-interface.png)<br>
*Utilisation de git-gui sur notre projet de développement : indexation d'un nouveau fichier avant de le push*

- En résumé : gitgui se concentre sur la génération de commit, le push/pull, et la gestion du dépôt, alors que gitk donne des informations sur l'historique de celui-ci.

> Référence :  <https://git-scm.com/docs/gitk/>  
<https://git-scm.com/docs/git-gui>

### <u>Q2: Quelle commande avez-vous utiliser pour installer ces deux applications ?</u>

Nous avons utilisé les commandes :

- `sudo apt install gitk`
- `sudo apt install git-gui`

pour installer respectivement gitk et git-gui.

### <u>Q3: Pourquoi avez vous installé ce logiciel ?</u>

Comme dit [précédemment](#a-notre-avancement-dans-linstallation), nous avons décidé d'installer GitUI sur notre machine pour comparer différentes interfaces git. GitUI à l'avantage d'être gratuit, et d'être libre de droit (licence MIT : utilisation commerciale, utilisation personnelle, modification et distribution autorisés à condition que la notice de licence et de copyright soit incluse dans toutes les copies).  
De plus, cette interface s'utilise à l'aide du terminal en lançant un fichier exécutable, son installation est donc facile et son utilisation nous ne nous est pas étrangère (même s'il y a des aides).

### <u>Q4: Comment l'avez-vous installé ?</u>

L'installation de GitUI est plutôt facile : l'interface se présente sous un fichier `.tar.gz`. Il faut le déplacer dans le répertoire qui contient le dépôt git.  

Pour extraire le fichier contenant le logiciel, il suffit d'utiliser la commande `tar fxz gitui-linux-musl.tar.gz`. Cette commande permet :  

- d'utiliser l'utilitaire tar avec `tar`
- d'utiliser un fichier, de l'extraire et de le désarchiver avec `fxz`  

Nous nous retrouvons avec un fichier exécutable appelé `gitui`.  

Toujours dans le terminal, exécuter le fichier avec `./gitui` suffit à lancer l'interface graphique dans le terminal et commencer à l'utiliser.  

Attention néanmoins, il est conseillé d'ajouter ce fichier `gitgui` dans le fichier `.gitignore` du dépôt git, car c'est un fichier 'personnel' qui n'est sûrement pas utile au développement de l'application du dépôt. A défaut de l'ajouter au fichier, il est recommendé de ne pas l'indexer lors de commit de changements.

Il est également possible d'ajouter GitUI aux variables d'environnement de Linux pour pouvoir l'exécuter partout sans avoir à inclure l'exécutable dans le dépôt git. C'est ce que nous avons fait.

![gitui dans variable env](./Rendu3-res/gitui-env.png)<br>
*Nous avons déplacé le script GitUI dans le fichier `/usr/bin`, pour que l'utilisation de la commande `gitui` soit disponible partout sur le système : il n'y a plus besoin de d'avoir le fichier gitui dans son dépôt git.*

> Référence : `man tar`  
> nos cours de système du premier semestre

### <u>Q5: Comparez-le à celui inclus avec git (et installé précédemment) : fonctionnalités avantages, inconvénients... ?</u>

Cette interface se rapproche beaucoup plus de git-gui que de gitk, car elle est surtout utile pour indexer des changements, faire des commits, et push/pull le dépôt. Elle ne permet pas de gérer les commits ou d'avoir une visualisation graphique de l'historique des changements.  

L'avantage de cette interface graphique par rapport à git-gui, c'est qu'elle est beaucoup plus pratique à utiliser avec le clavier qu'avec la souris (ce qui est, tout le monde le sait, beaucoup plus rapide). Elle permet également d'avoir plus d'informations sur les commits, même si elle ne remplace pas un graph comme celui disponible avec gitk.

Néanmoins, un inconvéniant à citer est que la résolution de conflits de fusion est assez compliquée, et il n'y a pas d'aides du tout, seulement un prompt qui nous invite à les résoudres.

![commit script avec guiui](./Rendu3-res/push-on-dev.png)<br>
*Commit d'un fichier script shell sur la branche 'dev' avec GitUI.*

![commit log](./Rendu3-res/commit-log.png)<br>
*Visualisation des commits sur la branche 'dev' : se rapproche de ce que l'on peut trouver avec gitk, mais en plus rudimentaire.*

![merge](./Rendu3-res/merge.png)<br>
*Fusion de la branche 'dev' dans la branche 'master' : simplifié grâce à GitUI.*
<h1 style="text-align: center;">S2.03 Installation de Services Réseaux</h1>

## <u>Rendu 4 : Installation de Gitea</u>

## A. Notre avancement dans l'installation

### <u>Installation de Gitea</u>

Nous avons bien installé Gitea en suivant les instructions de la documentation et avec les contraintes imposées.

![wget gitea](./Rendu4-res/wgetgitea.png)
*Étapes de l'installation de gitea : wget pour obtenir les fichiers binaires, chmod pour le rendre exécutable.*

![config initiale gitea](./Rendu4-res/configgitea)
*Configuration initiale de Gitea, en utilisant une base de donnée SQLite (A MODIFIER OMG)*

![config admin](./Rendu4-res/paramadmin.png)
*Configuration des paramètres administrateur comme demandé : nom d'utilisateur et adresse email.*

Après le suivi de toutes ces étapes, Gitea est installé est utilisable comme n'importe quel autre service Git.

### <u>Utilistation basique</u>

Nous avons créé un nouveau projet vide pour tester le bon fonctionnement de Gitea.

![creation de projet](./Rendu4-res/creanewrepo.png)
*Création d'une nouveau dépôt avec gitea.*

![modif projet](./Rendu4-res/premieremodif.png)
*Modification du fichier README.md en ligne.*

![modifications en ligne](./Rendu4-res/commitmodifsonline.png)  
*Commit des changements en ligne, le README.md est bien modifié.*

Pour ce qui est du dépôt d'un de nos projet existant, voir [nos réponses à la question 4.](#uq4-que-se-passe-t-il--quelle-semble-en-être-la-cause--lors-dun-dépôt-de-projet-existantu)

### <u>Dépôt de nos rapports</u>

Nous utilisions déjà GitLab pour collaborer sur les fichiers Markdown de nos rapport, nous avons donc décidé de faire un mirroir de notre projet GitLab pour qu'il soit accessible sur les deux services d'hébergement. Voir [nos réponses à la question 4.](#uq4-que-se-passe-t-il--quelle-semble-en-être-la-cause--lors-dun-dépôt-de-projet-existantu)

### <u>Les différents modes d'accès réseau de VirtualBox</u>

Nous avons redirigé les ports de notre machine, et Gitea fonctionnait effectivement depuis notre machine physique, ce qui nous a permis de créer un nouveau projet Gitea à partir d'un de nos projets existant.

![redirection des ports](./Rendu4-res/portforwarding.png)  
*Redirection des ports de notre machine.*

![screen gitea sur hote](./Rendu4-res/screengiteasurhote.png)
*Gitea est fonctionnel depuis le navigateur de notre machine physique*

## B. Réponses aux questions

### <u>Q1: Qu'est-ce que Gitea ?</u>

Gitea est une plateforme de service Git auto-hébergée, qui a pour but et principe d'être simple d'installation et d'utilisation.

### <u>Q2: A quels logiciels bien connus dans ce domaine peut-on le comparer ? Citez-en au moins 2.</u>

Gitea est comparable à d'autre plateforme d'hébergement de service Git comme GitHub, GitLab et BitBucket, parmis d'autres moins connues comme [liste des trucs moins connus trouvable dans les trucs de migration]

### <u>Q3: Qu'est-ce que Markdown ?</u>

Le Markdown est un langage dit "markup language" en anglais, ou

### <u>Q4: Que se passe-t-il ? Qu'elle semble en être la cause ? (lors d'un dépôt de projet existant)</u>

Pour cette partie, nous avons choisi de tester plusieurs méthodes.
Tout d'abord, nous allons essayer de push une projet existant depuis notre machine physique vers Gitea. -> spoiler ça marche pas.

Nous avons également décidé d'utiliser la fonctionnalité "migration" inclue avec Gitea. Elle permet de déplacer un dépôt Git hébergé depuis un autre système d'hébergement (Github par exemple) vers Gitea. Il est également possible de faire un miroir de ce dépôt pour qu'il soit accessible à partir des deux plateformes. Nous l'avons fait avec notre dépôt Gitlab que nous utilisons pour collaborer sur les fichiers Markdown qui vous lisez actuellement.

![usitilisation token d'accès](./Rendu4-res/gitlab-accestoken.png)
*Parce que GitLab est hébergé pour l'Université, et que notre dépôt est privé, nous devons utiliser une token d'accès.*

![migration depuis gitlab]()
*Utilisation du menu de migration depuis Gitea*

![c'est bien migré]()
*Lorsque des changements sont push sur le dépôt hébergé sur GitLab, les changements apparaissent également sur Gitea*

### <u>Q5: Comparer Gitea avec gitweb et avec le client graphique choisi précédemment.</u>

J'ai pas trop compris c'est quoi gitweb mais ça à l'air insane. Et notre client graphique c'est le meilleur il est trop bien.
<h1 style="text-align: center;">S2.03 Installation de Services Réseaux</h1>

## Rendu 1 : Préparation d'une machine virtuelle Debian

### A. Notre avancement dans l'installation

Nous n'avons pas rencontré de difficultés particulières lors de l'installation de la machine virtuelle. Nous l'avons chacun installé de notre côté pour pouvoir réaliser chaque tâche et comprendre les mécanismes de la machine virtuelle, tout en nous mettant d'accord lorsqu'il y a des choix techniques à réaliser.

<!-- <figure>
    <img style="width:75%;height:auto;" src="./Rendu1-res/specifications.png" alt="Spécificité d'une machine">
    <figcaption>
        Spécificité d'une des machines et l'environnement de bureau MATE installé
    </figcaption>
</figure> -->
![Spécificité d'une machine](./Rendu1-res/specifications.png)<!--{ width=50% } -->
*Spécificité d'une des machines et l'environnement de bureau MATE installé*

### B. Réponses aux questions

- #### <u>Q1: Quelle est la configuration réseau utilisée par défaut ?</u>

La configuration réseau par défaut de la machine invitée est NAT, ou Network Address Translation. C'est la configuration la plus simple pour que l'invité puisse accéder aux réseaux externes. La machine virtuelle peut communiquer avec Internet ou d'autres réseaux à travers un router, qui est dans ce cas le "VM VirtualBox networking engine" placé entre l'invité et l'hôte.  

Le VM VirtualBox NAT engine reçoit les paquets de la machine invitée, extrait les données de la trame TCP/IP, et l'envoie au système hôte. Pour les autres machines, c'est comme si les données avaient été envoyées de l'application "VM VirtualBox" de la machine hôte avec l'adresse IP de la machine hôte, et non pas de la machine invitée comme c'est le cas. L'engine écoute les réponses aux paquets envoyés, extrait les données et les renvoie vers la machine invitée.  

![Configuration réseau de notre machine](./Rendu1-res/network-settings.png)  
*Exemple : configuration de notre machine depuis VM VirtualBox*

> Référence : <https://www.virtualbox.org/manual/ch06.html>

### <ins>Q2: Quel est le nom du fichier XML contenant la configuration de votre machine ?</ins>

Le fichier XML qui contient la configuration de la machine se nomme `sae203.vbox-pre`  
Il a un emplacement différent selon le système d'exploitation de la machine hôte, sur Windows dans `$HOME\VirtualBox VMs\sae203\sae203.vbox-prev`  
Par ailleurs, on peut trouver le fichier de configuration globale de VM VirtualBox dans `$HOME\.VirtualBox\VirtualBox.xml` (sur Windows encore une fois)

> Référence : <https://docs.oracle.com/en/virtualization/virtualbox/6.0/admin/vboxconfigdata.html>  
<https://www.virtualbox.org/manual/ch08.html#vboxmanage-guestproperty>

### <ins>Q3: Qu’est-ce que la RAM ?</ins>

La RAM (de l'anglais 'random access memory', souvent traduit en français par 'mémoire vive') est un espace de stockage de données temporaire et rapide. L'ordinateur stocke dans la RAM les données auxquelles il devra avoir accès immédiatement ou très rapidement, à l'inverse d'un disque dur qui stocke les données plus lentement mais plus durablement.

![RAM alouée](./Rendu1-res/ram-alocated.png)  
*Exemple : RAM alouée à notre machine depuis VM VirtualBox*

### <ins>Q4: Qu’est-ce que signifie “64-bits” dans “Debian 64-bit” ?</ins>

64 bits correspond à la taille des mots binaires manipulés par le processeur.  
Là où un système 32 bits ne peut adresser au maximum une mémoire d'uniquement 2<sup>32</sup> (=4Gio, ~4Go), le système 64 bits peut adresser des mémoires jusqu'à 2<sup>64</sup> (=16Eio*, =Enormément de mémoire ~1.84x10<sup>10</sup>).  
En pratique il permet donc d'utiliser plus de 4Go de RAM (~3.5Go en pratique) pour sa machine.  

*Eio = Exbioctet = 2<sup>60</sup> octets

### <ins>Q5: Qu’est-ce qu’un fichier iso bootable ?</ins>

Un fichier iso est une représentation, l'image d'un disque à l'identique.
Ce format est très utilisé pour partager des fichiers d'installation, en particulier ceux de systèmes d'exploitation car il permet de rassembler tous les fichiers, en conservant leur ordre d'origine, dans un seul et même fichier.
Un ISO est une archive, il est donc moins lourd que l'ensemble des fichiers originals.

Bootable veut dire que l'ordinateur pourra démarrer à partir de cette image ISO, "gravée" sur un support (CD, USB, DD) lui même inséré dans la machine.

### <ins>Q6: Qu’est-ce que MATE ? GNOME ?</ins>

MATE et GNOME (acronyme de 'GNU Network Object Model Environment') sont des environnements de bureau. Ils permettent d'utiliser un ordinateur grâce à une interface utilisateur graphique (GUI en anglais).  
Ce sont des ensembles de programmes qui aident l'utilisateur à accéder et gérer les fichiers, tout en faisant l'impasse sur certaines fonctionnalités plus spécifiques de l'ordinateur.  
Ces environnements de bureau sont souvent un ensemble d'icônes, de fenêtres, et souvent un bureau, qui permettent des interactions humain-machine.
L'utilisation d'environnement de bureau se fait au détriment des performances maximales de la machine, celle-ci utilisant des ressources pour l'affichage graphique.
Sans environnement de bureau, l'ordinateur ne serait utilisable qu'en lignes de commandes, et serait donc beaucoup moins accessible au grand public.

![MATE sur notre machine](./Rendu1-res/mate.png)
*Exemple : l'environnement de bureau MATE installé sur notre machine*

> Référence : <https://en.wikipedia.org/wiki/Desktop_environment>

### <ins>Q7: Qu’est-ce qu’un serveur web ?</ins>

C'est un serveur informatique qui répond à des requêtes du World Wide Web sur un réseau public ou privé, en utilisant principalement le protocole HTTP.  

Un serveur web est soit un logiciel (serveur HTTP pour les ressources web), soit un serveur informatique (ordinateur) qui répond à des requêtes de la toile.
Un serveur web utilise principalement le protocole HTTP (Hypertext Transfer Protocol) ou sa variante sécurisée HTTPS (HTTP Secure) pour répondre aux requêtes de clients. Ces requêtes varient et changent la nature des échanges entre le client et le serveur. Par exemple, la méthode GET permet au client de recevoir une ressource demandée, alors que la méthode POST va envoyer des données à une ressource du serveur qui devra les traiter. A chaque fois que le client reçoit une réponse du serveur, elle est accompagné d'un code qui indique comment s'est passé l'échange (par exemple, `200 OK` indique que tout s'est déroulé comme prévu, alors qu'un code de la forme `4XX` indique qu'une erreur est survenue. Parmis les plus connues, `404 Not Found` indique que la ressource n'a pas été trouvée, ou encore `418 I'm a teapot` indique que le serveur est une théière).

Un serveur web peut également gérer l'envoi et la réception d'emails grâce à différents protocoles : SMTP (Simple Mail Transfer Protocole) qui est le protocole utilisé pour envoyer les mails entre serveurs, et POP3 (Post Office Protocol) et IMAP (Internet Message Access Protocol) pour récuper les mails du serveur vers le client. POP3 transfert les mails du serveur au client, alors qu'IMAP les copie.

Enfin, un serveur web peut emettre des flux de diffusion, héberger une base de données ou encore assurer le transfert de fichiers (File Transfer Protocol, FTP).

> Références : [HTTP](https://datatracker.ietf.org/doc/html/rfc7231)  
[HTCPCP](https://datatracker.ietf.org/doc/html/rfc2324)  
[SMTP](https://datatracker.ietf.org/doc/html/rfc8314)  
[IMAP](https://datatracker.ietf.org/doc/html/rfc9051)  
[FTP](https://datatracker.ietf.org/doc/html/rfc959)

### <ins>Q8: Qu’est-ce qu’un serveur ssh ?</ins>

SSH (secure shell) est un protocole pour sécuriser la connexion entre deux ordinateurs à distance à travers un réseau non sécurisé en encryptant les communications.  
Le protocole SSH fonctionne sur un modèle client/serveur. Une machine (client) qui souhaite se connecter à une autre (hôte) va envoyer une requête qui va être traitée par le serveur SSH de cet hôte.  

Pour ce qui est du fonctionnement de ce protocole, il y a tout d'abord une phase de connexion : le serveur SSH va transmettre au client sa clé publique, preuve que le client communique avec la bonne machine (et non pas un possible pirate qui essayerais d'intercepter la communication).  
Si l'authentification réussie, la machine hôte va donner au client l'accès au système avec les permissions du compte avec lequel il s'est connectée.  
Cette connexion sécurisée peut être utilisée pour de l'administration, de l'exécution de commande, et des transferts de fichiers (SFTP, une version sécurisé du File Transfer Protocole) à distance, parmis beaucoup d'autres utilisations.

> Référence : <https://www.ssh.com/academy/ssh/protocol>

### <ins>Q9: Qu’est-ce qu’un proxy (ou serveur mandataire) ?</ins>

Un proxy (serveur mandataire) est quelque chose qui joue le rôle d'intermédiaire entre 2 hôtes pour faciliter et/ou surveiller les échanges.  
C'est un entremetteur qui relaie les requêtes entre deux fonctions, l'une cliente l'autre serveur.  

Un proxy est souvent utilisé comme interface entre un réseau privé et Internet (comme c'est le cas à l'université par exemple). Les machines du réseau privé communiquent d'abord avec le proxy qui va traiter l'information et l'envoyer vers le serveur pour lequel la requête était réellement destiné. Lorsque le proxy reçoit les potentielles réponses, il les renvoie vers la machine du réseau qui avait envoyé une requête. Il n'y a donc pas de communication directe entre le client et le seveur.  

Ainsi, toutes les communications du réseau passent par ce proxy, ce qui permet de sécuriser les communications, de filtrer des requêtes indésirables, de créer un historique des requêtes, parmis d'autres avantages plus techniques.  
De plus, l'accès à des ressources via un proxy permet de contourner certaines règles gouvernementales dans les pays où Internet est censuré, car le proxy fait la requête à la ressource demandée à la place de l'utilisateur.  
Enfin, il existe des proxys à utilisation plus spécifique, comme un proxy DNS qui fait le relais direct en transmettant les requêtes DNS vers un DNS, et peut aussi les mettre en mémoire cache pour les réutiliser.

> Référence : <https://en.wikipedia.org/wiki/Proxy_server>
<h1 style="text-align: center;">S2.03 Installation de Services Réseaux</h1>

## <u>Rendu 2 : Préparation du système</u>

## A. Notre avancement dans l'installation

- Il n'y avait pas de décisions à prendre cette semaine pour le rendu, nous avons tous suivi les étapes de la préparation du système sur nos machines virtuelles en préparation des installations futures.
- Nous avons installé les différents paquets demandés dans l'énoncé, en plus de certains autres pour améliorer notre confort d'utilisation du système (comme pas exemple VSCodium).

  ![Paquets installés](./Rendu2-res/installed.png)
  *Quelques paquets que nous avons installé (liste non exhaustive)*

- Nous avons bien installé les suppléments invités sur chacunes des machines en utilisant la commande `mount` sur le CDRom.
- Finalement, nous avons exporté notre machine virtuelle au format `.ova` pour pouvoir redémarrer une installation proprement au cas où un problème venait à survenir dans le futur.

## B. Réponses aux questions

### <u>Q1: Comment peux-t-on savoir à quels groupes appartient l'utilisateur *user* ?</u>

Pour savoir à quel(s) groupe(s) appartient un utilisateur, on peut utiliser la commande `groups` en ligne de commande.  
L'utilisation de la commande sans aucun argument affiche le(s) groupe(s) dans le quel l'utilisateur qui execute la commande se trouve.  

Pour connaître les groupes d'autres utilisateurs (par exemple, si on est connecté en tant que *root* et qu'on veut savoir à quels groupes appartient *user*, dans le cadre d'administration du système), il suffit d'ajouter le nom de l'utilisateur en argument, et tous les groupes de cet utilisateur seront affichés.

![Utilisation de groups](./Rendu2-res/groups-usage.png)  
*Utilisation de `groups` connecté en tant que root*

> Référence : <https://www.man7.org/linux/man-pages/man1/groups.1.html> ou `man groups` en ligne de commande.

### <u>Q2: À quoi servent les paquets installés ?</u>

De nombreux paquets ont installés lors de cette étape. Voici un récapitulatif de ce qu'il font :

- `xterm` : émulateur de terminal.
- `vim` : "VI Improved", un éditeur de texte en ligne de commande.
- `curl` : outil qui permet de transferrer des données depuis ou vers un serveur en utilisant une URL, et qui supporte un grand nombre de protocoles.
- `git` : outil de gestion de versions décentralisés.
- `sqlite3` : gestion d'une base de donnée sqlite en ligne de commande.
- `build-essential` : ensemble de paquets qui sont nécessaires à la création de fichier .deb (Debian Linux Package File). Ces paquets sont :

  - `libc` : librairie standard C
  - `gcc` : collection de compilateurs de C et C++
  - `g++` : un compilateur de C
  - `make` : utilitaire pour compiler un fichier C et/ou un projet C en exécutable.
  - `dpkg-dev` et `hurd-dev`

  Exécuter la commande `sudo apt install build-essential` revient à installer tous ces paquets un à un (déconseillé car ces paquets ont des dépendances les uns envers les autres, il est donc conseillé de les installé dans le cadre de build-essential pour éviter des problèmes de dépendances).
- `dkms` : accronyme de 'Dynamic Kernel Module Support', c'est un environnement qui permet l'installation de versions supplémentaires des modules du noyau Linux.
- `linux-headers` : fichiers C qui contiennent de nombreuses fonctions et définitions de structures permettant de compiler des modules du noyau.

De manière générale, on peut penser que l'ensemble des paquets installés ont pour but de mettre en place un environnement de développement en C.

> Références :  
>
> - `man xterm`  
> - `man vim`  
> - `man curl`  
> - `man git`  
> - `man sqlite3`  
> - liste des paquets fournis avec build-essential trouvable dans `/usr/share/build-essential/list`  
> - `man libc`  
> - `man gcc`
> - `man make`  
> - `man dksm`  

### <u>Q3: Quel est le noyaux Linux utilisé par votre VM ? Comment l'avez vous trouvé ?</u>

La commande `uname` nous permet d'avoir des informations sur le système. Utilisé avec l'option -r, on peut optenir la révision du noyaux Linux utilisé par le système. En plus de ça, on peut optenir la version du noyau et la date de mise à jour avec l'option -v.

![utilisation de uname](./Rendu2-res/uname.png)  
*Affichage des spécificités de la machine avec uname*

> Référence : <https://www.man7.org/linux/man-pages/man1/uname.1.html> ou `man uname`

### <u>Q4: À quoi servent les suppléments invités ? Donner 2 principales raisons de les installer</u>

Les suppléments invités sont des drivers ou des applications installés sur la machine invitée pour optimiser les performances et la stabilité du système. De plus, ils offrent de nombreuses fonctionnalités qui permettent de faciliter le travail entre la machine hôte et la machine invitée.  

Installer ces suppléments est utile car :

- Ils permettent de faciliter les communications entre l'hôte et l'invité, ce qui permet de contrôler et de surveiller la machine virtuelle depuis la machine physique. Cela permet également d'envoyer des données entre les deux machines (dans les deux sens). Pour permettre cela, VirtualBox établit un canal de communication privé entre l'hôte et l'invité, et les deux peuvent alors envoyer des données dans un sens ou dans l'autre. Ce mécanisme permet également d'obtenir des données sur le système invité, comme le système d'exploitation exact, la version de l'installation des suppléments invités, les utilisateurs qui sont connectés sur le système invité, des statistiques sur les connexions réseaux de la machine, parmis d'autres fonctionnalités.
- Ils permettent de faciliter l'utilisation de la machine virtuelle grâce à plusieurs fonctionnalités : changement de résolution automatique en fonction de la taille de la fenêtre, partage de fichiers et du presse-papier entre les deux machines, et meilleure intégration du pointeur de la souris.

La liste complète des différents suppléments invités installés sur une machine peut être obtenue en utilisant la commande `guestproperty` de `VBoxManage` sur la machine physique.

![utilisation de guesproperty](./Rendu2-res/guestproperty.png)
*Enumération des suppléments invités installés sur une machine*

> Référence : <https://www.virtualbox.org/manual/ch04.html>  
<https://www.virtualbox.org/manual/ch08.html#vboxmanage-guestproperty>

### <u>Q5: À quoi sert la commande `mount` (dans notre cas de figure et dans le cas général) ?</u>

- Dans le cas général :  
    La commande `mount` permet d'attacher une partie du système de fichier choisie au système de fichier global de Linux (qui commence par la root /). Cette commande est très utile, surtout dans le cas où le système de fichier est répandu sur plusieurs machines ou à travers un réseau.  
    La configuration de base de la commande `mount` peut être trouvée et modifiée dans le fichier <u>/etc/fstab</u>. Ce fichier précise, lorsque que la commande ne le fait pas, où les fichiers sont généralement attachés et avec quelles options. Cette configuration sera utilisée lorsque la commande `mount -a` sera executée. En revanche, si l'appareil et le dossier cible sont spécifiés, la commande ne fera pas appel à ce fichier.

- Dans notre cas de figure :  
    La première commande `sudo mount /dev/cdrom /mnt` a attaché tous les dossiers et fichiers se trouvant dans /dev/cdrom au dossier /mnt du système de fichier de la machine. L'appareil (/dev/cdrom) et le dossier cible (/mnt) on été spécifiés, il n'y a donc pas d'options autres que celles spécifiés par la commande (c'est à dire aucune).  
    Puis, `sudo /mnt/VBoxLinuxAdditions.run` a exécuté le fichier VBoxLinuxAdditions.run, qui se trouve maintenant dans notre architecture de fichier.

![Exemple avec WSL](./Rendu2-res/wsl-example.png)  
*Exemple d'utilisation commune de la commande mount avec WSL (Windows Subsystem for Linux) : utilisation de l'architecture de fichier basique de Linux (avec / comme racine), à laquelle l'archtecture de fichier Windows (avec C: comme racine) est attachée avec mount*

> Référence : <https://www.man7.org/linux/man-pages/man8/mount.8.html> ou `man 8 mount`
<h1 style="text-align: center;">S2.03 Installation de Services Réseaux</h1>

## <u>Rendu 3 : Sélection d'un frontend</u>

## A. Notre avancement dans l'installation

Pour cette étape :

- Nous avons bien paramétré git comme indiqué dans l'énoncé.

![Configuration git](./Rendu3-res/gitconfig.png)<br>
*Configuration d'une machine pour utilisation de git.*

- Nous avons installé les deux paquets gitk et git-gui.

![Gitk et git-gui installé](./Rendu3-res/gitk-gitgui.png)<br>
*Gitk et git-gui sont installé sur le serveur.*

- Nous avons choisi GitUI comme interface graphique. [Voir réponses aux questions concernant GitUI.](#uq3-pourquoi-avez-vous-installé-ce-logiciel-u)

![utilisation de gitgui](./Rendu3-res/gituiutilisation.png)<br>
*Interface principale de GitUI, directement sur le terminal.*

## B. Réponses aux questions

### <u>Q1: Que sont les deux logiciels gitk et git-gui ?</u>

- gitk permet de naviguer sur un dépôt git. L'utilisation de la commande gitk permet de visualiser plusieurs informations :

  - Les changements entre deux commits (ou entre HEAD et un commit)
  - Un graph représentant l'historique des commits et les fusions de branches.
  - Des informations spécifiques sur un commit : date, numéro, commentaires, auteur des modifications (git blame)

![Utilisation de gitk sur notre projet de dev](./Rendu3-res/gitk-interface.png)<br>
*Utilisation de gitk sur notre projet de développement S2.01-S2.02 : visualisation de changements récents et graphe des changements.*

- git-gui : c'est une interface graphique de Git (GUI = Graphical User Interface). Celle-ci permet de faire des changements sur le dépôt en créant de nouveaux commits, d'indexer les modifications, de créer de nouvelles branches, de fusionner des branches locales, et permet également de push ou pull les modifications vers/depuis le dépôt.

![Utilisation de gitgui sur notre projet de dev](./Rendu3-res/git-gui-interface.png)<br>
*Utilisation de git-gui sur notre projet de développement : indexation d'un nouveau fichier avant de le push*

- En résumé : gitgui se concentre sur la génération de commit, le push/pull, et la gestion du dépôt, alors que gitk donne des informations sur l'historique de celui-ci.

> Référence :  <https://git-scm.com/docs/gitk/>  
<https://git-scm.com/docs/git-gui>

### <u>Q2: Quelle commande avez-vous utiliser pour installer ces deux applications ?</u>

Nous avons utilisé les commandes :

- `sudo apt install gitk`
- `sudo apt install git-gui`

pour installer respectivement gitk et git-gui.

### <u>Q3: Pourquoi avez vous installé ce logiciel ?</u>

Comme dit [précédemment](#a-notre-avancement-dans-linstallation), nous avons décidé d'installer GitUI sur notre machine pour comparer différentes interfaces git. GitUI à l'avantage d'être gratuit, et d'être libre de droit (licence MIT : utilisation commerciale, utilisation personnelle, modification et distribution autorisés à condition que la notice de licence et de copyright soit incluse dans toutes les copies).  
De plus, cette interface s'utilise à l'aide du terminal en lançant un fichier exécutable, son installation est donc facile et son utilisation nous ne nous est pas étrangère (même s'il y a des aides).

### <u>Q4: Comment l'avez-vous installé ?</u>

L'installation de GitUI est plutôt facile : l'interface se présente sous un fichier `.tar.gz`. Il faut le déplacer dans le répertoire qui contient le dépôt git.  

Pour extraire le fichier contenant le logiciel, il suffit d'utiliser la commande `tar fxz gitui-linux-musl.tar.gz`. Cette commande permet :  

- d'utiliser l'utilitaire tar avec `tar`
- d'utiliser un fichier, de l'extraire et de le désarchiver avec `fxz`  

Nous nous retrouvons avec un fichier exécutable appelé `gitui`.  

Toujours dans le terminal, exécuter le fichier avec `./gitui` suffit à lancer l'interface graphique dans le terminal et commencer à l'utiliser.  

Attention néanmoins, il est conseillé d'ajouter ce fichier `gitgui` dans le fichier `.gitignore` du dépôt git, car c'est un fichier 'personnel' qui n'est sûrement pas utile au développement de l'application du dépôt. A défaut de l'ajouter au fichier, il est recommendé de ne pas l'indexer lors de commit de changements.

Il est également possible d'ajouter GitUI aux variables d'environnement de Linux pour pouvoir l'exécuter partout sans avoir à inclure l'exécutable dans le dépôt git. C'est ce que nous avons fait.

![gitui dans variable env](./Rendu3-res/gitui-env.png)<br>
*Nous avons déplacé le script GitUI dans le fichier `/usr/bin`, pour que l'utilisation de la commande `gitui` soit disponible partout sur le système : il n'y a plus besoin de d'avoir le fichier gitui dans son dépôt git.*

> Référence : `man tar`  
> nos cours de système du premier semestre

### <u>Q5: Comparez-le à celui inclus avec git (et installé précédemment) : fonctionnalités avantages, inconvénients... ?</u>

Cette interface se rapproche beaucoup plus de git-gui que de gitk, car elle est surtout utile pour indexer des changements, faire des commits, et push/pull le dépôt. Elle ne permet pas de gérer les commits ou d'avoir une visualisation graphique de l'historique des changements.  

L'avantage de cette interface graphique par rapport à git-gui, c'est qu'elle est beaucoup plus pratique à utiliser avec le clavier qu'avec la souris (ce qui est, tout le monde le sait, beaucoup plus rapide). Elle permet également d'avoir plus d'informations sur les commits, même si elle ne remplace pas un graph comme celui disponible avec gitk.

Néanmoins, un inconvéniant à citer est que la résolution de conflits de fusion est assez compliquée, et il n'y a pas d'aides du tout, seulement un prompt qui nous invite à les résoudres.

![commit script avec guiui](./Rendu3-res/push-on-dev.png)<br>
*Commit d'un fichier script shell sur la branche 'dev' avec GitUI.*

![commit log](./Rendu3-res/commit-log.png)<br>
*Visualisation des commits sur la branche 'dev' : se rapproche de ce que l'on peut trouver avec gitk, mais en plus rudimentaire.*

![merge](./Rendu3-res/merge.png)<br>
*Fusion de la branche 'dev' dans la branche 'master' : simplifié grâce à GitUI.*
<h1 style="text-align: center;">S2.03 Installation de Services Réseaux</h1>

## <u>Rendu 4 : Installation de Gitea</u>

## A. Notre avancement dans l'installation

### <u>Installation de Gitea</u>

Nous avons bien installé Gitea en suivant les instructions de la documentation et avec les contraintes imposées.

![wget gitea](./Rendu4-res/wgetgitea.png)
*Étapes de l'installation de gitea : wget pour obtenir les fichiers binaires, chmod pour le rendre exécutable.*

![config initiale gitea](./Rendu4-res/configgitea)
*Configuration initiale de Gitea, en utilisant une base de donnée SQLite (A MODIFIER OMG)*

![config admin](./Rendu4-res/paramadmin.png)
*Configuration des paramètres administrateur comme demandé : nom d'utilisateur et adresse email.*

Après le suivi de toutes ces étapes, Gitea est installé est utilisable comme n'importe quel autre service Git.

### <u>Utilistation basique</u>

Nous avons créé un nouveau projet vide pour tester le bon fonctionnement de Gitea.

![creation de projet](./Rendu4-res/creanewrepo.png)
*Création d'une nouveau dépôt avec gitea.*

![modif projet](./Rendu4-res/premieremodif.png)
*Modification du fichier README.md en ligne.*

![modifications en ligne](./Rendu4-res/commitmodifsonline.png)  
*Commit des changements en ligne, le README.md est bien modifié.*

Pour ce qui est du dépôt d'un de nos projet existant, voir [nos réponses à la question 4.](#uq4-que-se-passe-t-il--quelle-semble-en-être-la-cause--lors-dun-dépôt-de-projet-existantu)

### <u>Dépôt de nos rapports</u>

Nous utilisions déjà GitLab pour collaborer sur les fichiers Markdown de nos rapport, nous avons donc décidé de faire un mirroir de notre projet GitLab pour qu'il soit accessible sur les deux services d'hébergement. Voir [nos réponses à la question 4.](#uq4-que-se-passe-t-il--quelle-semble-en-être-la-cause--lors-dun-dépôt-de-projet-existantu)

### <u>Les différents modes d'accès réseau de VirtualBox</u>

Nous avons redirigé les ports de notre machine, et Gitea fonctionnait effectivement depuis notre machine physique, ce qui nous a permis de créer un nouveau projet Gitea à partir d'un de nos projets existant.

![redirection des ports](./Rendu4-res/portforwarding.png)  
*Redirection des ports de notre machine.*

![screen gitea sur hote](./Rendu4-res/screengiteasurhote.png)
*Gitea est fonctionnel depuis le navigateur de notre machine physique*

## B. Réponses aux questions

### <u>Q1: Qu'est-ce que Gitea ?</u>

Gitea est une plateforme de service Git auto-hébergée, qui a pour but et principe d'être simple d'installation et d'utilisation.

### <u>Q2: A quels logiciels bien connus dans ce domaine peut-on le comparer ? Citez-en au moins 2.</u>

Gitea est comparable à d'autre plateforme d'hébergement de service Git comme GitHub, GitLab et BitBucket, parmis d'autres moins connues comme [liste des trucs moins connus trouvable dans les trucs de migration]

### <u>Q3: Qu'est-ce que Markdown ?</u>

Le Markdown est un langage dit "markup language" en anglais, ou

### <u>Q4: Que se passe-t-il ? Qu'elle semble en être la cause ? (lors d'un dépôt de projet existant)</u>

Pour cette partie, nous avons choisi de tester plusieurs méthodes.
Tout d'abord, nous allons essayer de push une projet existant depuis notre machine physique vers Gitea. -> spoiler ça marche pas.

Nous avons également décidé d'utiliser la fonctionnalité "migration" inclue avec Gitea. Elle permet de déplacer un dépôt Git hébergé depuis un autre système d'hébergement (Github par exemple) vers Gitea. Il est également possible de faire un miroir de ce dépôt pour qu'il soit accessible à partir des deux plateformes. Nous l'avons fait avec notre dépôt Gitlab que nous utilisons pour collaborer sur les fichiers Markdown qui vous lisez actuellement.

![usitilisation token d'accès](./Rendu4-res/gitlab-accestoken.png)
*Parce que GitLab est hébergé pour l'Université, et que notre dépôt est privé, nous devons utiliser une token d'accès.*

![migration depuis gitlab]()
*Utilisation du menu de migration depuis Gitea*

![c'est bien migré]()
*Lorsque des changements sont push sur le dépôt hébergé sur GitLab, les changements apparaissent également sur Gitea*

### <u>Q5: Comparer Gitea avec gitweb et avec le client graphique choisi précédemment.</u>

J'ai pas trop compris c'est quoi gitweb mais ça à l'air insane. Et notre client graphique c'est le meilleur il est trop bien.
