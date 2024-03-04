FROM alpine:latest


RUN apk add --no-cache postgresql postgresql-contrib && \
    mkdir -p /run/postgresql && \
    chown -R postgres:postgres /run/postgresql


COPY entrypoint.sh /entrypoint.sh



# Autoriser l'exécution du script
RUN chmod +x /entrypoint.sh


EXPOSE 5432

# Utilisateur par défaut
USER postgres

# pt entré container
ENTRYPOINT ["/entrypoint.sh"]