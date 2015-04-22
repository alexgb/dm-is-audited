module DataMapper
  module Is
    module Audited
      module Model
        
        def audit (*audited_attributes, &block)
          before :save do
            @original_attributes = original_attributes.map {|p,v| [p.name, v]}.to_h
            @audited_new_record = new?
          end

          after :save do
            update_attributes_changes @original_attributes, attributes, audited_attributes
            next if changes.empty? and not @audited_new_record

            self.instance_exec(@audited_new_record ? :create : :update, &block)
          end

          after :destroy do
            update_attributes_changes attributes, {}, audited_attributes
            self.instance_exec(:destroy, &block)
          end

        end
      end
    end
  end
end
