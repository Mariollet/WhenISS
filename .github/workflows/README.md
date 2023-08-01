# Github Workflows

Ceci est une liste de github actions fantastique qui fait toutes sortes de choses incroyables !

## Installation

$ `git clone git@github.com:keole/github_workflows.git .github/workflows`

## Choisir son workflow

.github/workflows$ `git checkout {workflow_name}`

###### Workflow disponible :

- [Flutter](https://github.com/keole/github_workflows/tree/workflows_fl) - workflows_fl
- [Symfony](https://github.com/keole/github_workflows/tree/workflows_sf) - workflows_sf

## Supprimer la remote github

.github/workflows$ `git remote remove origin`
  

## Configuration

Avant de pouvoir exécuter les GitHub Actions, vous devez configurer certaines informations sensibles en tant que secrets dans votre référentiel GitHub. Les secrets sont utilisés pour protéger les informations sensibles et garantir qu'elles ne sont pas exposées publiquement.

### Secrets requis

Assurez-vous de définir les secrets suivants dans votre référentiel GitHub :

- `REMOTE_HOST`: L'adresse du serveur distant où vous souhaitez vous connecter.
- `REMOTE_USER`: Votre nom d'utilisateur pour la connexion au serveur distant.
- `REMOTE_PASSWORD`: Votre mot de passe pour la connexion au serveur distant.

Pour ajouter ces secrets à votre référentiel GitHub, suivez les étapes suivantes :

1. Accédez à la page principale de votre référentiel GitHub.
2. Cliquez sur l'onglet **Settings** en haut de la page.
3. Dans le menu de gauche, cliquez sur **Secrets**.
4. Cliquez sur le bouton **New repository secret** pour ajouter un nouveau secret.
5. Entrez le nom et la valeur du secret, puis cliquez sur **Add secret**.
6. Répétez les étapes 4 et 5 pour ajouter les deux autres secrets restants.

### Utilisation des secrets avec GitHub Actions

Une fois que vous avez ajouté les secrets à votre référentiel GitHub, vous pouvez les utiliser dans vos workflows GitHub Actions. Voici un exemple de fichier de workflow où les secrets sont utilisés :

```yaml
name: Mon Flux d'Actions

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout le code source
        uses: actions/checkout@v2

      - name: Exécutez mon script fantastique
        env:
          REMOTE_HOST: ${{ secrets.host }}
          REMOTE_USER: ${{ secrets.user }}
          REMOTE_PASSWORD: ${{ secrets.password }}
        run: |
          # Utilisez les secrets pour vous connecter au serveur distant
          mon_script_fantastique --host $REMOTE_HOST --user $REMOTE_USER --password $REMOTE_PASSWORD
```
