module CodeGenerator
  module Tokenify
    extend ActiveSupport::Concern
  
    module ClassMethods
      def tokenify!(field, opts = {})
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