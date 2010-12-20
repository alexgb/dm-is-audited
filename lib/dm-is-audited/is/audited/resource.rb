module DataMapper
  module Is
    module Audited
      module Resource
        
        def changes
          if @audited_original_attributes
            @audited_original_attributes.merge(@audited_original_attributes) { |property, value|
              [value, attribute_get(property.name)] if attribute_get(property.name) != value
            }.delete_if {|k,v| v.nil?}
          else
            {}
          end
        end
        
      end
    end
  end
end