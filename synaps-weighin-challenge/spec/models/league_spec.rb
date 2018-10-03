# frozen_string_literal: true
require 'spec_helper'

describe League do
  let(:person) { Person.create(league_id: subject.id) }
  let(:person2) { Person.create }
  let(:subject) { League.create }
  let(:e1) { Event.create(name: '1') }
  let(:e2) { Event.create(name: '2') }
  let(:user) { User.create(email: 'tester@murphyweighin.com', password: 'eat2compete') }

  let(:c1) { CreateCheckin.call(person, e1, 100, user) }
  let(:c2) { CreateCheckin.call(person2, e2, 100, user) }

  describe '#participating_events' do
    before { e1; e2; c1; c2; }
    it 'includes leagues events' do
      expect(subject.participating_events).to include(e1)
    end

    it 'does not include events that league members are not in' do
      expect(subject.participating_events).not_to include(e2)
    end
  end
end
