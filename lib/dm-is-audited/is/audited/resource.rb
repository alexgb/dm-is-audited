module DataMapper
  module Is
    module Audited
      module Resource

        def changes
          @audited_attributes_changes
        end

        def update_attributes_changes(original_attributes, changed_attributes, audited_attribute_names)
          @audited_attributes_changes = original_attributes
            .select{|k, v| audited_attribute_names.include?(k) and changed_attributes[k] != v}
            .map{|k, v| [ properties[k], [ v, changed_attributes[k] ] ]}
            .to_h
        end
      end
    end
  end
end
