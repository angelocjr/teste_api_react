#!/bin/bash
set -e

# Remover arquivos de servidor antigos
rm -f tmp/pids/server.pid

# Executa as migrations
bundle exec rails db:migrate

#precompile
RAILS_ENV=development bundle exec rake assets:precompile

# Executar comandos passados no docker-compose
exec "$@"


