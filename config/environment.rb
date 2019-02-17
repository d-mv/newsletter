require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/newsletter'
require_relative '../apps/web/application'

Hanami.configure do
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/newsletter_development.sqlite3'
      #  s
    #    adapter :sql, 'mysql://localhost/newsletter_development'
    #
    adapter :sql, ENV.fetch('DATABASE_URL')
    # adapter type: :sql, uri: 'postgres://localhost/database'

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  # mailer do
  #   root 'lib/newsletter/mailers'

  #   # See http://hanamirb.org/guides/mailers/delivery
  #   delivery :test
  # end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []

    # mailer do
    #   delivery :smtp, address: ENV.fetch('SMTP_HOST'), port: ENV.fetch('SMTP_PORT')
    # end
  end
end
