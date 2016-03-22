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

    def fill!()
      @pdf.fill_form(@original_pdf, @output_pdf, pdf_values, flatten: true)
    end

    def pdf_values
      raise NotImplementedError
    end
  end
end
