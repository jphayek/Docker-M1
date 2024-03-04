#!/bin/sh

# Vérifie si le dossier de données est vide. Si vide, crea base de données.
if [ -z "$(ls -A /var/lib/postgresql/data)" ]; then
    # init bd
    initdb -D /var/lib/postgresql/data
    
    
    postgres -D /var/lib/postgresql/data & 
    sleep 
    
    
    psql --command "CREATE USER my_username WITH SUPERUSER ENCRYPTED PASSWORD 'pass';"


    psql --command "CREATE DATABASE db;"
    
    # Exécution des commandes SQL pour configurer la base de données
    psql -d db -U my_username <<EOF
CREATE TABLE todo (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(255),
    status VARCHAR(255),
    description TEXT
);

INSERT INTO todo (titre, status, description) VALUES
    ('Finir Docker', 'pas du tout', 'On a merdé....'),
    ('Finir Docker', 'pas du tout', 'On a merdé....'),
    ('Finir Docker', 'pas du tout', 'On a merdé....')
    ;
EOF

    
    
    killall postgres
    wait $!
fi

#  autoriser les connexions externes
echo "listen_addresses='*'" >> /var/lib/postgresql/data/postgresql.conf

#  toutes les connexions
echo "host all all 0.0.0.0/0 md5" >> /var/lib/postgresql/data/pg_hba.conf

# Dem PostgreSQL
exec postgres -D /var/lib/postgresql/data