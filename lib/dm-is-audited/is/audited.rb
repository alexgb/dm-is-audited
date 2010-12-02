require 'dm-core'
require File.join(File.dirname(__FILE__), 'audited', 'resource')
require File.join(File.dirname(__FILE__), 'audited', 'model')


# include in DM
module DataMapper
  Model.append_extensions(Is::Audited::Model)
  Model.append_inclusions(Is::Audited::Resource)
end


# overrides of Proc and Object to support calling blocks with context and parameters
class Proc
  def bind(object)
    block, time = self, Time.now
    (class << object; self end).class_eval do
      method_name = "__bind_#{time.to_i}_#{time.usec}"
      define_method(method_name, &block)
      method = instance_method(method_name)
      remove_method(method_name)
      method
    end.bind(object)
  end
end

class Object
  unless defined? instance_exec # 1.9
    def instance_exec(*arguments, &block)
      block.bind(self)[*arguments]
    end
  end
end