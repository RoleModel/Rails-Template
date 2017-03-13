# RoleModel Software Rails Template

This template aids Rails in setting up a new project with some standardized
default settings.

## Using This Template
The ruby and rails versions here are not the latest versions. (TODO: update this template...) To use as-is:

1. Make sure you have exactly Ruby version 2.3.1 installed. All other versions will fail the template installation.
```bash
rbenv versions
```
If you don't have 2.3.1:
```bash
rbenv install 2.3.1
gem install rails // since every Ruby version needs its own Rails
```

2. In the parent directory above where you want to put your new project, set it to use this Ruby version:
```bash
rbenv local 2.3.1
```

3. Clone this directory:
```bash
git clone https://github.com/RoleModel/Rails-Template.git rolemodel-rails-template
```

4. Start your Rails project using the template from this directory:
```bash
rails new hello_world -m rolemodel-rails-template/lib/template.rb
```
Don't worry if you see errors like: `Could not find gem 'rails_12factor' in any of the gem sources listed in your Gemfile`. The next step will take care of it.

5. Run bundle install in your project directory:
```bash
cd hello_world
bundle install
```

Someday, instead of the above, we'd like to be able to do this, but it DOES NOT WORK right now:
```bash
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

The template provides Docker setup as an option.  When this is selected bundler and the generators will be skipped so they can be run directly on the Docker container after running `docker-compose up`.
