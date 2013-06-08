require "code_generator/configure"
require "code_generator/generator"

require "code_generator/orms/mongoid"          if defined? ::Mongoid
require "code_generator/orms/active_record"    if defined? ::ActiveRecord