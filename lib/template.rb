# This is a flat template file. This is what Rails expects to be passed
# in to `rails new _appname_ -m this_file.rb`

templates_root = File.expand_path(File.join('..', 'templates'), File.dirname(__FILE__))
source_paths << templates_root

module RMSTemplate
  RUBY_VERSION = '2.3.0'.freeze
  FILES = %w(
    .rubocop.yml
    Gemfile.tt
    .ruby-version.tt
  )
end

force_our_files = yes?('Automatically overwrite default Rails files?')

# Set up Gemfile
if (@use_devise = yes?('Install Devise?'))
  after_bundle do
    generate 'devise:install'
    generate 'devise user'
  end
end

# Set up test frameworks
after_bundle do
  generate 'rspec:install'
  generate 'spinach'
end

# Set up Git Repo, if desired
if yes?('Set up Git Repo?')
  after_bundle do
    git :init
    git add: '.'
    git commit: ' -m "Initial commit"'
  end
end

# Source all our template files, force if desired
RMSTemplate::FILES.each do |filename|
  template(filename, force: force_our_files)
end


# Since we have a .ruby-version file being added ... if we don't match,
# bundle install will fail (or install on the wrong Ruby version). So
# let our users know!
if RMSTemplate::RUBY_VERSION != RUBY_VERSION
  say <<-FAILURE
    Non-matching Ruby Version.
    Template expects #{RMSTemplate::RUBY_VERSION}, but found #{RUBY_VERSION}!
  FAILURE
  exit 1
end
