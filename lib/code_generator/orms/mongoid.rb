require "code_generator/tokenify"

module Mongoid
  module CodeGenerator
    extend ActiveSupport::Concern
    
    include ::CodeGenerator::Tokenify
    
  end
end