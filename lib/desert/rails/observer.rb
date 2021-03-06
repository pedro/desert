module Desert
  module Rails
    module Observer
      def self.observers=(*observers)
        @observers = observers.flatten
      end
      def self.observers
        @observers ||= []
      end
    end
  end
end

class Rails::Initializer
  def load_observers_with_desert
    # todo verify if this should be logged
    puts  "Adding #{Desert::Rails::Observer.observers.inspect} to #{ActiveRecord::Base.observers.inspect}"
    ActiveRecord::Base.observers += Desert::Rails::Observer.observers.uniq
    load_observers_without_desert
  end
  alias_method_chain :load_observers, :desert
end