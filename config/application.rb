require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Wortschule
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.time_zone = "Europe/Berlin"
    config.i18n.available_locales = %i[de]
    config.i18n.default_locale = :de

    config.active_storage.variable_content_types += ["image/svg+xml"]
    config.active_storage.content_types_to_serve_as_binary -= ["image/svg+xml"]
    config.active_storage.content_types_allowed_inline += ["image/svg+xml"]

    config.generators do |g|
      g.template_engine :haml
    end

    # If true, blank attributes are hidden when showing words
    config.hide_blank_items = true

    # All routes of the application are moved below this identifier. This is
    # used to free up the root URLs for the words, e.g. `/adler`
    config.default_app_namespace = "seite"

    config.active_job.queue_adapter = :good_job

    # Cronjob config
    # See https://github.com/bensheldon/good_job#cron-style-repeatingrecurring-jobs
    config.good_job.enable_cron = true
    config.good_job.cron = {
      # Every 5 minutes, run the TTS job
      tts: {
        cron: "*/5 * * * *",
        class: "TtsJob"
      }
    }
  end
end
