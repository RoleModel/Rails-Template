# RoleModel Software Rails Template

This template aids Rails in setting up a new project with some standardized
default settings.

## Using This Template

This template assumes that you have Rails installed!
```
rails new app_name -m https://raw.githubusercontent.com/RoleModel/Rails-Template/master/lib/template.rb
```

## Ruby/Rails Setup

### Ruby Version

The current Ruby Version for this template is 2.3.0.

### Rails Version

The current Rails Version for this template is 4.2.x.

### Web Server

Webrick is replaced—even for development—with Puma. This becomes a standard
option in Rails 5.0, so we are hoping to make the transition easier!

### Database

This template updates your Gemfile to utilize the `pg` gem, providing
PostgreSQL as the default database.

### Test Frameworks

We install RSpec and Spinach for your use.

### Authentication

Currently, this template provides Devise as an option.

### View Templates

Slim is currently the preferred Rails View template gem.

## Docker

TODO: Maybe?
