require "thor"

module Figaro
  class CLI < Thor
    # figaro install

    desc "install", "Install Figaro"

    method_option "path",
      aliases: ["-p"],
      default: "config/application.yml",
      desc: "Specify a configuration file path"

    def install
      require "figaro/cli/install"
      Install.start
    end

    # figaro heroku:set

    desc "heroku:set", "Send Figaro configuration to Heroku"

    method_option "app",
      aliases: ["-a"],
      desc: "Specify a Heroku app"
    method_option "environment",
      aliases: ["-e"],
      desc: "Specify an application environment"
    method_option "path",
      aliases: ["-p"],
      default: "config/application.yml",
      desc: "Specify a configuration file path"
    method_option "remote",
      aliases: ["-r"],
      desc: "Specify a Heroku git remote"

    define_method "heroku:set" do
      require "figaro/cli/heroku_set"
      HerokuSet.run(options)
    end

    # figaro aptible:set

    desc "aptible:set", "Send Figaro configuration to Aptible"

    method_option "app",
                  aliases: ["-a"],
                  desc: "Specify an Aptible app"
    method_option "environment",
                  aliases: ["-e"],
                  desc: "Specify an application environment"
    method_option "path",
                  aliases: ["-p"],
                  default: "config/application.yml",
                  desc: "Specify a configuration file path"
    method_option "remote",
                  aliases: ["-r"],
                  desc: "Specify an Aptible git remote"

    define_method "aptible:set" do
      require "figaro/cli/aptible_set"
      AptibleSet.run(options)
    end

  end
end
