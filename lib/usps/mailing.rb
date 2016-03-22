# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

require "usps_intelligent_barcode"

module USPS
  class Mailing
    attr_accessor :barcode_id, :service_type, :mailer_id, :serial_number, :address

    SERVICE_TYPES = {
      :first_class => 700,
      :standard => 702,
      :periodicals => 704,
      :bound_printed_matter => 706
    }

    def initialize(service_type:, mailer_id:, serial_number:, address:)
      @barcode_id = "00"
      @service_type = USPS::Mailing::SERVICE_TYPES[service_type]
      @mailer_id = mailer_id
      @serial_number = serial_number
      @address = address
    end

    def barcode
      Imb::Barcode.new(
        @barcode_id,
        @service_type,
        @mailer_id,
        @serial_number,
        @address.routing_code
      ).barcode_letters
    end
  end
end
