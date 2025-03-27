# 🐳 Environnement Docker pour Vite React

<p align="center">
  <a href="#-fonctionnalités">Fonctionnalités</a> •
  <a href="#-démarrage-rapide">Démarrage rapide</a> •
  <a href="#-installation">Installation</a> •
  <a href="#-utilisation">Utilisation</a> •
  <a href="#-comment-ça-fonctionne">Comment ça fonctionne</a> •
  <a href="#-structure-du-projet">Structure du projet</a> •
  <a href="#-faq">FAQ</a> •
  <a href="#-contribuer">Contribuer</a> •
  <a href="#-licence">Licence</a>
</p>

<p align="center">
  <img src="https://img.shields.io/github/license/votrenomdutilisateur/vite-react-docker-env" alt="Licence">
  <img src="https://img.shields.io/github/stars/votrenomdutilisateur/vite-react-docker-env" alt="Étoiles">
  <img src="https://img.shields.io/github/forks/votrenomdutilisateur/vite-react-docker-env" alt="Forks">
  <img src="https://img.shields.io/github/issues/votrenomdutilisateur/vite-react-docker-env" alt="Issues">
</p>

## 🚀 Fonctionnalités

Un environnement de développement portable et cohérent pour les projets React TypeScript utilisant Vite. Configurez votre environnement de développement en quelques minutes sur n'importe quelle machine !

- **🐳 Configuration Docker complète** pour les projets React + Vite
- **⚡ Rechargement à chaud ultra-rapide** grâce à Vite
- **🧰 Support TypeScript** intégré
- **🔄 Mapping de volume** pour node_modules (pas de réinstallation nécessaire entre les sessions)
- **📦 Script d'installation** de l'environnement dans n'importe quel projet React
- **🌗 Support des configurations** de développement et de production
- **🔌 Intégration facile** avec vos projets existants
- **📝 Documentation complète** incluse

## 🏁 Démarrage rapide

### Prérequis

- [Docker](https://www.docker.com/get-started) installé sur votre machine
- [Git](https://git-scm.com/downloads) pour le contrôle de version

# 🔧 Guide d'installation - Docker Desktop et Git CLI

Ce guide vous présente les étapes pour installer Docker Desktop et Git CLI sur les systèmes d'exploitation Windows et Linux.

## 🐳 Installation de Docker Desktop

### Windows

<details>
<summary>Instructions pour Windows</summary>

1. Téléchargez Docker Desktop depuis le [site officiel](https://www.docker.com/products/docker-desktop/)

2. Exécutez le fichier d'installation téléchargé (`Docker Desktop Installer.exe`)

3. Suivez les instructions d'installation à l'écran

4. Une fois l'installation terminée, Docker Desktop démarrera automatiquement

5. Pour vérifier l'installation, ouvrez PowerShell ou une invite de commande et exécutez :
   ```powershell
   docker --version
   ```

> **Note** : Sur Windows, Docker Desktop nécessite WSL 2 (Windows Subsystem for Linux 2) et l'activation de la virtualisation dans le BIOS.

</details>

### Linux (Ubuntu/Debian)

<details>
<summary>Instructions pour Linux</summary>

Docker Desktop a des exigences système spécifiques pour Linux, notamment le support de KVM. Voici les commandes pour l'installer sur Ubuntu/Debian :

1. Supprimez les anciennes versions de Docker (si présentes) :
   ```bash
   sudo apt-get remove docker docker-engine docker.io containerd runc
   ```

2. Mettez à jour les packages et installez les prérequis :
   ```bash
   sudo apt-get update
   sudo apt-get install ca-certificates curl gnupg
   ```

3. Ajoutez la clé GPG officielle de Docker :
   ```bash
   sudo install -m 0755 -d /etc/apt/keyrings
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   sudo chmod a+r /etc/apt/keyrings/docker.gpg
   ```

4. Configurez le repository :
   ```bash
   echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```

5. Mettez à jour les packages :
   ```bash
   sudo apt-get update
   ```

6. Installez Docker Engine :
   ```bash
   sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   ```

7. Téléchargez le package DEB Docker Desktop :
   ```bash
   curl -O https://desktop.docker.com/linux/main/amd64/docker-desktop-4.27.1-amd64.deb
   ```
   > **Note** : Vérifiez la dernière version disponible sur le [site Docker](https://docs.docker.com/desktop/install/ubuntu/)

8. Installez le package :
   ```bash
   sudo apt-get install ./docker-desktop-4.27.1-amd64.deb
   ```

9. Démarrez Docker Desktop depuis le menu des applications ou via la commande :
   ```bash
   systemctl --user start docker-desktop
   ```

10. Vérifiez l'installation :
    ```bash
    docker --version
    ```

</details>

## 📝 Installation de Git CLI

### Windows

<details>
<summary>Instructions pour Windows</summary>

1. Téléchargez Git pour Windows depuis le [site officiel](https://git-scm.com/download/win)

2. Exécutez le fichier d'installation téléchargé (`Git-x.xx.x-64-bit.exe`)

3. Suivez les instructions d'installation (les paramètres par défaut conviennent généralement)
   
   ![Git Windows Installation](https://git-scm.com/book/en/v2/images/git-setup.png)

4. Une fois l'installation terminée, ouvrez PowerShell ou une invite de commande et vérifiez l'installation :
   ```powershell
   git --version
   ```

5. Configurez vos informations Git :
   ```powershell
   git config --global user.name "Votre Nom"
   git config --global user.email "votre.email@example.com"
   ```

</details>

### Linux (Ubuntu/Debian)

<details>
<summary>Instructions pour Linux</summary>

1. Mettez à jour les packages :
   ```bash
   sudo apt-get update
   ```

2. Installez Git :
   ```bash
   sudo apt-get install git
   ```

3. Vérifiez l'installation :
   ```bash
   git --version
   ```

4. Configurez vos informations Git :
   ```bash
   git config --global user.name "Votre Nom"
   git config --global user.email "votre.email@example.com"
   ```

</details>

## 🚀 Démarrer avec l'environnement Docker pour Vite React

Une fois Docker et Git installés, vous pouvez cloner le dépôt de l'environnement et l'installer dans votre projet :

```bash
# Cloner le dépôt de l'environnement Docker
git clone https://github.com/votrenomdutilisateur/vite-react-docker-env.git

# Installer l'environnement dans votre projet
cd vite-react-docker-env
./scripts/install-in-project.sh /chemin/vers/votre/projet-react

# Démarrer l'environnement
cd /chemin/vers/votre/projet-react
./docker/scripts/start-dev.sh
```

## 🔍 Vérification de l'installation

### Docker
```bash
docker --version
docker-compose --version
docker run hello-world
```

### Git
```bash
git --version
git config --list
```

## 🛠️ Dépannage

### Docker Desktop

- **Erreur WSL2 sur Windows** : Assurez-vous que WSL2 est correctement installé et configuré
  ```powershell
  wsl --update
  ```

- **Problèmes d'autorisation sur Linux** : Ajoutez votre utilisateur au groupe docker
  ```bash
  sudo usermod -aG docker $USER
  newgrp docker
  ```

### Git

- **'git' n'est pas reconnu comme commande interne** : Redémarrez votre terminal ou votre ordinateur

- **Erreurs SSL sur Windows** : Désactivez la vérification SSL (à utiliser avec précaution)
  ```bash
  git config --global http.sslVerify false
  ```

## 📚 Ressources supplémentaires

- [Documentation Docker](https://docs.docker.com/)
- [Documentation Git](https://git-scm.com/doc)
- [Guide WSL2 pour Docker](https://docs.docker.com/desktop/wsl/)
- [Pro Git Book](https://git-scm.com/book/fr/v2)

### 🔧 Installation

**1. Clonez ce dépôt :**

```bash
git clone https://github.com/votrenomdutilisateur/vite-react-docker-env.git
cd vite-react-docker-env
```

**2. Installez l'environnement Docker dans votre projet React :**

```bash
# Pointez vers un projet React existant
./scripts/install-in-project.sh /chemin/vers/votre/projet-react
```

Ou créez un nouveau projet Vite React avec cet environnement :

```bash
./scripts/create-new-project.sh mon-super-projet
```

## 🎮 Utilisation

### Démarrer l'environnement de développement

Après avoir installé l'environnement Docker dans votre projet, naviguez vers le répertoire de votre projet et exécutez :

```bash
cd /chemin/vers/votre/projet-react
./docker/scripts/start-dev.sh
```

Cela démarrera le conteneur Docker avec le serveur de développement Vite. Visitez http://localhost:5173 pour voir votre application.

### Construire pour la production

```bash
./docker/scripts/build.sh
```

Cela créera une version optimisée pour la production de votre application dans le dossier `dist`.

### Exécuter Storybook (si configuré dans votre projet)

```bash
./docker/scripts/start-storybook.sh
```

Accédez à Storybook à l'adresse http://localhost:6006

## 🔍 Comment ça fonctionne

<p align="center">
  <img src="docs/workflow-diagram.png" alt="Diagramme de flux de travail" width="800"/>
</p>

Cet environnement utilise Docker pour créer une expérience de développement cohérente sur différentes machines. Voici ce qui se passe en coulisses :

1. **Création du conteneur Docker** : Un conteneur est créé à partir de l'image Node.js Alpine avec tous les outils de développement nécessaires.
2. **Mapping des volumes** : Vos fichiers de projet sont mappés dans le conteneur, avec un volume dédié pour node_modules.
3. **Installation des dépendances** : La première fois que vous exécutez l'environnement, les dépendances sont installées et mises en cache dans le volume node_modules.
4. **Serveur de développement Vite** : Vite s'exécute à l'intérieur du conteneur Docker, offrant un remplacement de module à chaud ultra-rapide.
5. **Transfert de port** : Les ports nécessaires sont transférés du conteneur vers votre machine hôte.

## 📂 Structure du projet

```
vite-react-docker-env/
├── Dockerfile                # Configuration du conteneur
├── docker-compose.yml        # Orchestration des services
├── docker-entrypoint.sh      # Script d'initialisation
├── scripts/
│   ├── start-dev.sh          # Démarrage de l'environnement de développement
│   ├── build.sh              # Script de construction pour la production
│   ├── install-in-project.sh # Installation dans des projets existants
│   └── create-new-project.sh # Création de nouveaux projets
├── templates/
│   ├── .env.development.template  # Modèle de variables d'environnement
│   └── .gitignore.docker.template # Modèle gitignore pour les fichiers Docker
├── docs/                     # Documentation et images
└── README.md                 # Ce fichier
```

## ❓ FAQ

### Q : Dois-je réinstaller node_modules à chaque redémarrage de Docker ?
**R :** Non ! Le répertoire node_modules est monté comme un volume Docker, persistant entre les redémarrages du conteneur.

### Q : Puis-je utiliser cet environnement avec un projet React existant ?
**R :** Absolument ! Il suffit d'exécuter `./scripts/install-in-project.sh /chemin/vers/votre/projet` pour ajouter cet environnement à votre projet.

### Q : Est-ce que ça fonctionne avec des frameworks React comme Next.js ou Remix ?
**R :** Cet environnement est spécifiquement optimisé pour Vite + React. Pour Next.js ou d'autres frameworks, vous devrez peut-être personnaliser la configuration.

### Q : Comment ajouter des variables d'environnement personnalisées ?
**R :** Modifiez le fichier `.env.development` à la racine de votre projet, qui a été créé lors du processus d'installation.

### Q : Puis-je personnaliser la configuration Docker ?
**R :** Oui ! Après l'installation, tous les fichiers Docker sont copiés dans le répertoire `docker/` de votre projet. N'hésitez pas à les modifier selon vos besoins.

## 🤝 Contribuer

Les contributions sont toujours les bienvenues ! N'hésitez pas à soumettre une Pull Request.

1. Forkez le dépôt
2. Créez votre branche de fonctionnalité : `git checkout -b fonctionnalite/super-fonctionnalite`
3. Committez vos changements : `git commit -m 'Ajout d'une super fonctionnalité'`
4. Poussez vers la branche : `git push origin fonctionnalite/super-fonctionnalite`
5. Ouvrez une Pull Request

## 📜 Licence

Distribué sous la licence MIT. Voir `LICENSE` pour plus d'informations.

## 🙏 Remerciements

- [Vite](https://vitejs.dev/)
- [React](https://reactjs.org/)
- [Docker](https://www.docker.com/)
- [TypeScript](https://www.typescriptlang.org/)

---

<p align="center">
  Fait avec ❤️ par Votre Nom
</p>
