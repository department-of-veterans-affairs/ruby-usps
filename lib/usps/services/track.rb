# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.
#

require "usps/service"
require "nokogiri"

module USPS
  class Track < USPS::Base
    def by_id(tracking_number)
      data = Nokogiri::XML::Builder.new do |xml|
        tfr = xml.TrackFieldRequest {
          id = xml.TrackID {}
          id.ID = tracking_number
        }
        tfr["USERID"] = @user_id
        tfr
      end
      query(data)["TrackResponse"]
    end

    def self.api_name
      "TrackV2"
    end

    def self.service_name
      "track"
    end
  end
end
