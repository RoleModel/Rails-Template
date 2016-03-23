# This is a work-in-progress for what could potentially be a replacement
# AppGenerator. It will currently run if called was a Rails Template, but
# it's more similar to Suspenders - a complete replacement for `rails new`.

module RMSTemplate
  RUBY_VERSION = '2.3.0'

  class AppGenerator < Rails::Generators::AppGenerator
    attr_accessor :use_devise

    # NOTE: We have to tell it not to run ourselves... again, otherwise... error
    def apply_rails_template
    end

    def finish_template
      invoke :rms_customization
      super
    end

    def rms_customization
      invoke :customize_gemfile
      invoke :setup_authentication
      invoke :setup_repository
      invoke :setup_test_environment
    end

    def customize_gemfile
    end

    def setup_authentication
      if (@use_devise = yes?("Install Devise?"))
        after_bundle do
          generate 'devise:install'
          generate 'devise user'
        end
      end
    end

    def setup_repository
      if yes?("Set up Git Repo?")
        after_bundle do
          git :init
          git add: "."
          git commit: " -m 'Initial commit'"
        end
      end
    end

    def setup_test_environment
      after_bundle do
        generate 'rspec:install'
      end
    end

    # if RMSTemplate::RUBY_VERSION != RUBY_VERSION
    #   say <<-FAILURE
    #   Non-matching Ruby Version.
    #   Template expects #{RMSTemplate::RUBY_VERSION}, but found #{RUBY_VERSION}!
    #   FAILURE
    #   exit 1
    # end
  end
end

source_path = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH << source_path

templates_root = File.expand_path(File.join("..", "templates"), File.dirname(__FILE__))
RMSTemplate::AppGenerator.source_root templates_root
RMSTemplate::AppGenerator.source_paths << Rails::Generators::AppGenerator.source_root << templates_root

RMSTemplate::AppGenerator.start
