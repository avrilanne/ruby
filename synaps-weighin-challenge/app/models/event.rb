class Event < ActiveRecord::Base
  # TODO: add validations?
  default_scope { order(created_at: :asc) }
  has_many :checkins
  has_many :people, -> { distinct }, through: :checkins
end
