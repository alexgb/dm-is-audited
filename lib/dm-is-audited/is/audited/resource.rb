module DataMapper
  module Is
    module Audited
      module Resource
        
        def changes
          if @audited_original_attributes
            @audited_original_attributes.merge(@audited_original_attributes) do |property, value|
              [value, attribute_get(property.name)] if attribute_get(property.name) != value
            end
          else
            {}
          end
        end
        
      end
    end
  end
end