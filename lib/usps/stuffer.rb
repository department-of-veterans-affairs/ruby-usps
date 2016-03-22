# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

require "usps"
require "pdf-forms"

module USPS
  class Stuffer
    def initialize(original_pdf:, output_pdf:, mailing:)
      @mailing = mailing
      @original_pdf = original_pdf
      @output_pdf = output_pdf
      @pdf = PdfForms.new("pdftk", data_format: "XFdf")
    end

    def fill!
      @pdf.fill_form(@original_pdf, @output_pdf, pdf_values, flatten: true)
    end

    def pdf_values
      raise NotImplementedError
    end
  end
end
