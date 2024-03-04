FROM alpine:latest

# Installation de PostgreSQL
RUN apk add --no-cache postgresql postgresql-contrib && \
    mkdir -p /run/postgresql && \
    chown -R postgres:postgres /run/postgresql

# Copie du script d'entrée dans le conteneur
COPY entrypoint.sh /entrypoint.sh



# Autoriser l'exécution du script
RUN chmod +x /entrypoint.sh

# Exposition du port standard PostgreSQL
EXPOSE 5432

# Utilisateur par défaut
USER postgres

# Définition du script d'entrée comme point d'entrée du conteneur
ENTRYPOINT ["/entrypoint.sh"]