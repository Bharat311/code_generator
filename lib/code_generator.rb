class CodeGenerator
  
  class ScopeNotSpecifiedError < StandardError; end
  class FieldNotSpecifiedError < StandardError; end
  class ClassNotFoundError < StandardError; end
  
  AVAILABLE_CHARACTERS = ("A".."Z").to_a + (0..9).to_a
  INVALID_CHARACTERS = [0, "O", 1, "I", 8, "B"]
  DEFAULT_CODE_LENGTH = 10
  
  attr_reader :scoped_class
  attr_accessor :length, :uniqueness
  
  def initialize(opts = {})
    opts.symbolize_keys!
    @length     = opts.delete(:length) || DEFAULT_CODE_LENGTH
    @uniqueness = opts.delete(:uniqueness)
    set_scoped_class_and_field! if uniqueness
  end
  
  def valid_characters
    AVAILABLE_CHARACTERS - INVALID_CHARACTERS
  end

  def unique?
    @scoped_class.send(:where, {@field_name => @code}).empty?
  end
    
  def random_string
    chars = valid_characters
    Array.new(length){ chars.sample() }.join
  end
  
  def generate_code
    @code = random_string
    if generate_unique?
      @code = random_string until(unique?)
    end
    @code
  end
  
  class << self
    def generate(opts = {})
      cg = new(opts)
      cg.generate_code
    end
  end
  
  private
  
    def get_scoped_class
      uniqueness[:scope].to_s.classify.constantize
    rescue
      raise
    end
    
    def set_scoped_class_and_field!
      raise ScopeNotSpecifiedError if uniqueness[:scope].blank?
      raise FieldNotSpecifiedError if uniqueness[:field].blank?
      @scoped_class = get_scoped_class
      raise ClassNotFoundError  if @scoped_class.blank?
      @field_name = uniqueness[:field]
      #TODO - raise an error if field not found for the model. Needs to be indepedent for ActiveRecord & Mongoid.
    end
    
    def generate_unique?
      uniqueness.present?
    end
    
end