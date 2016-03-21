# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module USPS
  class Address
    class NoZipError < RuntimeError
    end

    attr_accessor :name, :firm, :line_1, :line_2, :city, :state, :zip5, :zip4

    def initialize(
        name: "", firm: "",
        line_1: "", line_2: "",
        city: "", state: "",
        zip5: "", zip4: ""
    )
      @name = name
      @firm = firm
      @line_1 = line_1
      @line_2 = line_2
      @city = city
      @state = state
      @zip5 = zip5
      @zip4 = zip4
    end

    def mailing(mailer_id:, serial_number:)
      USPS::Mailing.new(
        mailer_id: mailer_id,
        serial_number: serial_number,
        address: self
      )
    end

    def routing_code
      raise NoZipError, "No Zip-5 set" unless @zip5 != ""
      return @zip5 unless @zip4 != ""
      @zip5 + @zip4
    end
  end
end
