# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.
#
require 'usps/service'

require "nokogiri"

module USPS
  class Verify < USPS::Base
    def address(line_1:, line_2: "", city:, state:, zip5: "", zip4: "")
      data = Nokogiri::XML::Builder.new do |xml|
        addr = xml.AddressValidateRequest {
          xml.Address {
            xml.Address1 line_1
            xml.Address2 line_2
            xml.City city
            xml.State state
            xml.Zip5 zip5
            xml.Zip4 zip4
          }
        }
        addr['USERID'] = @user_id
        addr
      end

      self.query data
    end
  end
end

