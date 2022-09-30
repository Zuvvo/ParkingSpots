class SpotHistoryData < ApplicationRecord
  belongs_to :spot, dependent: :destroy
  enum action: [:reserved, :canceled, :expired]
end
