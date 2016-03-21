# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.


module USPS
  class Address
    attr_accessor :line_1, :line_2, :city, :state, :zip5, :zip4

    def initialize(line_1: "", line_2: "", city: "", state: "", zip5: "", zip4: "")
      @line_1 = line_1
      @line_2 = line_2
      @city = city
      @state = state
      @zip5 = zip5
      @zip4 = zip4
    end
  end
end
