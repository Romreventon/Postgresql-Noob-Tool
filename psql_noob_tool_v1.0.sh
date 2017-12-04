#!/bin/bash

# Postgresql Noob Tool est un outitl très rudimentaire pour t'aider à installer facilement Postgresql sur ta machine ;)

DELAY=3 # nombre de secondes pour afficher le résultat

while true; do
  clear
  cat << _EOF_
--------------------------
 Postgresql Noob Tool 1.0
--------------------------

1. Jouer
2. Installer
3. Configurer
4. A lire !
0. Quitter

_EOF_

  read -p "Votre choix [0-4] > "

  if [[ $REPLY =~ ^[0-4]$ ]]; then
    case $REPLY in
      1)
          
        echo "Connexion en tant qu'utilisateur 'postgres' :"
        su postgres
        psql -l
        continue
        ;;
      2)
        echo "Vérifiez que vous êtes bien connecté à internet. [Pressez Entrée pour valider]"
        read -p ""
        sudo apt-get update
        sudo apt-get install postgresql
        sleep $DELAY
        continue
        ;;
      3)
        echo "Modification du mot de passe de l'utilisateur 'postgres' :"
        sudo passwd postgres
        sleep $DELAY
        continue
        ;;
      4)
        echo ""        
        echo " Postgresql Noob Tool v1.0 - Romain Poupin"
        echo "-------------------------------------------"
        echo ""
        echo "- Compatible Ubuntu/Debian/Dérivés (car Noob Tool télécharge et installe postgresql via l'outil apt-get...)"
        echo ""
        echo "- L'installation de postgresql ajoute automatiquement l'utilisateur 'postgres' qui est l'utilisateur par défaut autorisé à jouer avec postgresql"
        echo "- Menu 'Configurer' pour définir le mot de passe de l'utilisateur 'postgres'"  
        echo ""        
        echo "- Menu 'Jouer' pour basculer vers l'utilisateur 'postgres' et utiliser postgresql"
        echo "- Tapez 'exit' pour revenir sur Noob Tool et vous déconnecter de l'utilisateur 'postgres'"
        echo ""
        echo "[RAPPEL] Créer, implémenter, et remplir ta base de données sous postgresql :"
        echo "- 'createdb nom_de_ta_bdd'"
        echo "- 'psql nom_de_ta_bdd'"
        echo "- '\i Chemin/de/ton/script.txt'"
        echo "- 'dropdb nom_de_ta_bdd' pour supprimer ta base de données"
        echo ""- 
        echo "[Pressez Entrée]"  
        read -p ""
        continue
        ;;
      0)
        break
        ;;
    esac
  else
    echo "Entrée invalide."
    sleep $DELAY
  fi
done
clear
