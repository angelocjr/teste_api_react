FROM ruby:3.2

# Definindo diretório de trabalho
WORKDIR /app

# Instalando dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

# Copiando os arquivos do Bundler
COPY /project/Gemfile /project/Gemfile.lock ./

# Instalando as gems
RUN bundle install

# Copiando o restante da aplicação
COPY . .

# Adicionando permissão para o entrypoint
COPY project/entrypoint.sh /project/entrypoint.sh
RUN chmod +x /project/entrypoint.sh

# Definindo o entrypoint
ENTRYPOINT ["/project/entrypoint.sh"]

# Comando padrão para iniciar o Rails
CMD ["rails", "server", "-b", "0.0.0.0"]

