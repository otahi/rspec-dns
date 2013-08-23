module ZonesMacro
  module ClassMethods
  end

  module InstanceMethods
  end

  def self.included(base)
    base.extend(ClassMethods)
    base.send :include, InstanceMethods
  end
end
