# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

require "nokogiri"
require "nori"

require "net/http"

module USPS
  class Base
    def initialize(user_id:)
      @user_id = user_id
    end

    def self.service_name
      name.split("::").last.downcase
    end

    def self.api_name
      name.split("::").last
    end

    def query(data)
      uri = URI.parse("https://secure.shippingapis.com/ShippingAPI.dll")
      params = { API: self.class.service_name, XML: data.to_xml }
      uri.query = URI.encode_www_form(params)
      req = Net::HTTP::Get.new(uri.to_s)
      res = Net::HTTP.start(uri.host, uri.port, use_ssl: true) { |http| http.request(req) }
      Nori.new(parser: :nokogiri).parse(res.body)
    end
  end
end
