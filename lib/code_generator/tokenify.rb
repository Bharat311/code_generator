module CodeGenerator
  module Tokenify
    extend ActiveSupport::Concern
  
    module ClassMethods
      def tokenify!(field, opts = {})
        opts[:uniqueness] = { model: self.to_s.underscore, 
                              field: field } if opts.delete(:unique)
        
        after_initialize do |record|
          if record.send(field).blank?
            token = CodeGenerator::Generator.generate(opts)
            record.send("#{field}=", token)
          end
        end
      end
    end
    
  end
end