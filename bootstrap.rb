

# mostly because of OpenStruct#to_h
raise "Ruby 2.0.0 or higher is required" if RUBY_VERSION < "2.0"


require 'rubygems'
require 'ostruct'
require 'active_attr'

require_relative 'lib/ecb_base'
require_relative 'app/entities'
require_relative 'app/use_cases'
