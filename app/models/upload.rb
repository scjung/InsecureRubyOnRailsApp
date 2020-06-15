# frozen_string_literal: true

# Upload model
class Upload < ApplicationRecord
  has_one_attached :file
end
