# frozen_string_literal: true

# Typed models for the YesnoGenerator SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Api entity data model.
#
# @!attribute [rw] answer
#   @return [String]
#
# @!attribute [rw] forced
#   @return [Boolean]
#
# @!attribute [rw] image
#   @return [String]
Api = Struct.new(
  :answer,
  :forced,
  :image,
  keyword_init: true
)

# Request payload for Api#load.
#
# @!attribute [rw] answer
#   @return [String, nil]
#
# @!attribute [rw] forced
#   @return [Boolean, nil]
#
# @!attribute [rw] image
#   @return [String, nil]
ApiLoadMatch = Struct.new(
  :answer,
  :forced,
  :image,
  keyword_init: true
)

