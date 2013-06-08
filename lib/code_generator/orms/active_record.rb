require "code_generator/tokenify"

class ActiveRecord::Base
  
  include ::CodeGenerator::Tokenify
   
end