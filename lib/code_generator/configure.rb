module CodeGenerator
  
  LOWER_ALPHA         = ('a'..'z').to_a
  UPPER_ALPHA         = ('A'..'Z').to_a
  ALPHA               = LOWER_ALPHA + UPPER_ALPHA
  NUMERIC             = (0..9).to_a
  LOWER_ALPHA_NUMERIC = LOWER_ALPHA + NUMERIC
  UPPER_ALPHA_NUMERIC = UPPER_ALPHA + NUMERIC
  ALPHA_NUMERIC       = ALPHA + NUMERIC
  
  mattr_accessor :length
  @@length = 10
  
  mattr_accessor :use_chars
  @@use_chars = :alpha_numeric

  mattr_accessor :include_chars
  @@include_chars = nil
  
  mattr_accessor :invalid_chars
  @@invalid_chars = Array.new
  
  mattr_accessor :valid_chars
  
  class << self
    def configure
      yield self
    end
    
    def valid_characters
      return @@valid_chars if @@valid_chars
      _chars    = "CodeGenerator::#{use_chars.upcase}".constantize
      _chars   |=  include_chars unless include_chars.empty?
      _invalid  = invalid_chars
      @@valid_chars = _chars - _invalid
    end
  end
    
end