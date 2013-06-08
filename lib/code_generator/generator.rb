module CodeGenerator

  class ScopeNotSpecifiedError < StandardError; end
  class FieldNotSpecifiedError < StandardError; end
  class ClassNotFoundError < StandardError; end
  
  class Generator
    
    attr_reader :scoped_class
    attr_accessor :length, :uniqueness
  
    def initialize(opts = {})
      opts.symbolize_keys!
      @length     = opts.delete(:length) || CodeGenerator.length
      @uniqueness = opts.delete(:uniqueness)
      set_scoped_class_and_field! if uniqueness
    end
  
    def unique?
      @scoped_class.send(:where, {@field_name => @code}).empty?
    end
    
    def random_string
      chars = CodeGenerator.valid_characters
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
        raise CodeGenerator::ClassNotFoundError
      end
    
      def set_scoped_class_and_field!
        raise CodeGenerator::ScopeNotSpecifiedError if uniqueness[:scope].blank?
        raise CodeGenerator::FieldNotSpecifiedError if uniqueness[:field].blank?
        @scoped_class = get_scoped_class
        @field_name = uniqueness[:field]
        #TODO - raise an error if field not found for the model. Needs to be indepedent for ActiveRecord & Mongoid.
      end
    
      def generate_unique?
        uniqueness.present?
      end
    
  end
end