module Colorgy
  class << self
    attr_accessor :time_class
  end

  self.time_class = Time
end
