module Spiffy
  class SpiffyController < ApplicationController
    class << self
      def project_loaded?
        true
      end

      def common_method
        "Project"
      end
    end
  end
end