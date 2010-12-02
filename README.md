# dm-is-audited

Plugin for DataMapper to allow for simple auditing of models. This plugin does not implement auditing itself, but creates a block context in which you can implement your own auditing procedures.

## Example

Each time a person is created, updated, or destroyed the block passed to audit will be evaluated in the context of the changed resource. Use the `action` parameter and the resource method `changes` to construct your audit logs.

    class Person
      include DataMapper::Resource

      # properties
      property :id,                       Serial
      property :name,                     String
      property :email,                    String
      property :favorite_color,           String

      # auditing
      audit :name, :email do |action|

        Log.new(
          :action =>  action,
          :message => changes.collect {|prop, values| "'#{prop.name}' changed from '#{values[0]}' to '#{values[1]}'"}.join(", ")
        ).save

      end

    end


## Contributing to dm-is-audited
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2010 Alex Gibbons. See LICENSE.txt for
further details.

