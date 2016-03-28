# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

require "usps_intelligent_barcode"

module USPS
  class Mailing
    attr_accessor :barcode_id, :service_type, :mailer_id, :serial_number, :address

    def initialize(
      mail_class:, mailer_id:, serial_number:, address:,
      address_correction_option: :manual,
      method: :manual,
      automation: true,
      tracking: true
    )
      @barcode_id = "00"
      @mailer_id = mailer_id
      @serial_number = serial_number
      @address = address

      @service_type = service_id(
        mail_class: mail_class,
        address_correction_option: address_correction_option,
        method: method,
        automation: automation,
        tracking: tracking
      )
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

    def service_id(mail_class:, address_correction_option:, method:, automation:, tracking:)
      index = 0
      index += 2 if automation
      index += 1 if tracking

      groups = USPS::Mailing::SERVICE_TYPE_IDS[mail_class]
      group = groups[USPS::Mailing::ACS_METHOD[address_correction_option]]
      entry = group[USPS::Mailing::SERVICE_ENDORSEMENT_OPTIONS[method]]
      entry[index]
    end

    ACS_METHOD = {
      manual: 0,
      one_code: 1,
      full_service_acs: 2,
      traditional_acs: 3
    }.freeze

    SERVICE_ENDORSEMENT_OPTIONS = {
      none: 0,
      manual: 1,

      asr1: 0,
      asr2: 1,
      csr1: 2,
      csr2: 3,
      rsr2: 4,
      trsr2: 5
    }.freeze

    SERVICE_TYPE_IDS = {
      first_class: [
        [
          [300, 310, 260, 270], # NAC
          [700,  40,  36,  41], # Manual
        ],
        [
          [230, 220, nil, nil], # ASR1
          [ 80, 140, nil, nil], # ASR2
          [504, 502, nil, nil], # CSR1
          [ 82, 240, nil, nil], # CSR2
          [341, 340, nil, nil], # RSR2
          [345, 344, nil, nil], # TRSR2
        ],
        [
          [nil, nil, 320, 314], # ASR1
          [nil, nil,  81, 141], # ASR2
          [nil, nil, 516, 514], # CSR1
          [nil, nil,  83, 241], # CSR2
          [nil, nil, 343, 342], # RSR2
          [nil, nil, 232, 222], # TRSR2
        ],
        [
          [501, 500, 505, 503], # ASR1
          [507, 506, 509, 508], # ASR2
          [517, 515, 521, 519], # CSR1
          [510, 530, 512, 511], # CSR2
          [535, 534, 537, 536], # RSR2
          [543, 538, 545, 544]  # TRSR2
        ]
      ],
      standard: [
        [
          [301, 311, 261, 271], # NAC
          [702,  42,  37,  43], # Manual
        ],
        [
          [ 90, 142, nil, nil], # ASR1
          [334, 585, nil, nil], # ASR2
          [ 92, 242, nil, nil], # CSR1
          [513, 586, nil, nil], # CSR2
          [272, 262, nil, nil], # RSR2
        ],
        [
          [nil, nil,  91, 143], # ASR1
          [nil, nil, 550, 548], # ASR2
          [nil, nil,  93, 243], # CSR1
          [nil, nil, 567, 231], # CSR2
          [nil, nil, 529, 587], # RSR2
        ],
        [
          [540, 539, 542, 541], # ASR1
          [547, 546, 551, 549], # ASR2
          [560, 559, 562, 561], # CSR1
          [565, 564, 568, 566], # CSR2
          [570, 569, 572, 571], # RSR2
        ]
      ]
    }.freeze
  end
end
