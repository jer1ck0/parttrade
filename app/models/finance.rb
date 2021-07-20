class Finance < ApplicationRecord
    has_one :orders
    scope :income, -> { where(dc: true) }
    scope :outcome, -> { where.not(dc: true) }
    scope :period, -> (period) {where(created_at: (DateTime.now - period.days).beginning_of_day()..DateTime.now) }
end
