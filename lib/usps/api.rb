# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

require "usps/services/verify"

module USPS
  class API
    def initialize(user_id:)
      @config = { user_id: user_id }
    end

    def self.all
      ObjectSpace.each_object(Class).select { |klass| klass < USPS::Base }
    end

    USPS::API.all.each do |service|
      define_method(service.service_name.downcase) do
        service.new @config
      end
    end
  end
end
