class League < ActiveRecord::Base
  has_many :people

  # TODO: maybe create a join table ei. league_events - with more clarification on if a league can have 'private' vs. public events.

  def participating_events
    events = []
    people.each do |p|
      events.push(p.events)
    end
    events.flatten
  end
end
