require_relative "tennis_center_gem/api"
require_relative "tennis_center_gem/cli"
require_relative "tennis_center_gem/tennis_center"
require_relative "tennis_center_gem/version"
require 'colorize'
require 'http'
require 'pry'


module TennisCenterGem
  class Error < StandardError; end
end
