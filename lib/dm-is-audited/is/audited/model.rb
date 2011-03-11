module DataMapper
  module Is
    module Audited
      module Model
        
        def audit (*fields, &block)
          
          audited_attributes = fields.collect { |name| properties[name] }
          
          before :save do
            @audited_original_attributes = original_attributes.dup.delete_if { |key, value| !audited_attributes.include?(key) }
            @audited_new_record = new?
          end

          after :save do
            self.instance_exec(@audited_new_record ? :create : :update, &block) if !changes.empty? || @audited_new_record
          end

          after :destroy do
            self.instance_exec(:destroy, &block)
          end
          
        end
        
      end
    end
  end
end