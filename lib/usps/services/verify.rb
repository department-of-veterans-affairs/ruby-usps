# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.
#

require "usps/service"
require "nokogiri"

module USPS
  class Verify < USPS::Base
    def address(address)
      data = Nokogiri::XML::Builder.new do |xml|
        addr = xml.AddressValidateRequest {
          xml.Address {
            xml.Address1 address.line_1
            xml.Address2 address.line_2
            xml.City address.city
            xml.State address.state
            xml.Zip5 address.zip5
            xml.Zip4 address.zip4
          }
        }
        addr["USERID"] = @user_id
        addr
      end
      create_address(query(data)["AddressValidateResponse"])
    end

    private

    def create_address(data)
      root = data["Address"]
      USPS::Address.new(
        line_1: root["Address1"],
        line_2: root["Address2"],
        city: root["City"],
        state: root["State"],
        zip5: root["Zip5"],
        zip4: root["Zip4"]
      )
    end
  end
end
