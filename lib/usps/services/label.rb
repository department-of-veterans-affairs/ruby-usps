# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.
#

require "usps/service"
require "nokogiri"

module USPS
  class Label < USPS::Base
    def self.api_name
      "DelivConfirmCertifyV4"
    end

    def self.service_name
      "label"
    end

    def create
    end

    # Constants {{{

    # IMAGE_PARAMETERS {{{
    IMAGE_PARAMETERS = {
      barcode: "BARCODE ONLY",
      crop: "CROP",
      separate_continue_page: "SEPARATECONTINUEPAGE"
    }.freeze
    # }}}

    # SERVICE_TYPES {{{
    SERVICE_TYPES = {
      priority: "PRIORITY",
      first_class: "FIRST CLASS",
      retail_ground: "RETAIL GROUND",
      media_mail: "MEDIA MAIL",
      library_mail: "LIBRARY MAIL"
    }.freeze
    # }}}

    # IMAGE_TYPES {{{
    IMAGE_TYPES = {
      tif: "TIF",
      pdf: "PDF",
      none: "NONE"
    }.freeze
    # }}}

    # CONTAINERS {{{
    CONTAINERS = {
      variable: "VARIABLE",
      flat_rate_envelope: "FLAT RATE ENVELOPE",
      legal_flat_rate_envelope: "LEGAL FLAT RATE ENVELOPE",
      padded_flat_rate_envelope: "PADDED FLAT RATE ENVELOPE",
      gift_card_flat_rate_envelope: "GIFT CARD FLAT RATE ENVELOPE",
      small_flat_rate_envelope: "SM FLAT RATE ENVELOPE",
      window_flat_rate_envelope: "WINDOW FLAT RATE ENVELOPE",
      small_flat_rate_box: "SM FLAT RATE BOX",
      medium_flat_rate_box: "MD FLAT RATE BOX",
      large_flat_rate_box: "LG FLAT RATE BOX",
      regional_rate_box_a: "REGIONALRATEBOXA",
      regional_rate_box_b: "REGIONALRATEBOXB",
      rectangular: "RECTANGULAR",
      nonrectangular: "NONRECTANGULAR"
    }.freeze
    # }}}

    # EXTRA_SERVICES {{{
    EXTRA_SERVICES = {
      insurance_non_priority: 100,
      adult_signature_required: 119,
      adult_signature_restricted_delivery: 120,
      insurance_priority: 125,
      usps_tracking: 115,
      signature_confirmation_electronic_restricted_delivery: 174,
      insurance_restricted_delivery: 177,
      insurance_restricted_delivery_priority: 179
    }.freeze
    # }}}

    # CARRIER_RELEASES {{{
    CARRIER_RELEASES = {
      front_door_or_porch: "A",
      parcel_locker: "B",
      partner_parcel_locker: "C",
      smart_parcel_locker: "D",
      left_with_individual: "E",
      front_desk_reception: "F",
      neighbor: "G",
      garage_area: "H",
      side_door_or_porch: "I",
      back_door_or_porch: "J",
      amazon_parcel_locker: "K"
    }.freeze
    # }}}

    # CONTENT_TYPES {{{
    CONTENT_TYPES = {
      hazmat: "HAZMAT",
      lives: "LIVES",
      perishable: "PERISHABLE",
      fragile: "FRAGILE"
    }.freeze
    # }}}

    # CONTENT_DESCRIPTIONS {{{
    CONTENT_DESCRIPTIONS = {
      bees: "BEES",
      day_old_poultry: "DAYOLDPOULTRY",
      adult_birds: "ADULTBIRDS",
      other: "OTHER"
    }.freeze
    # }}}

    SIZES = { regular: "REGULAR", large: "LARGE" }.freeze

    # }}}
  end
end

# vim: foldmethod=marker
