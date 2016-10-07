require_relative 'journey'

class JourneyLog

attr_reader :journey_class, :journey_history

def initialize(journey_class = Journey.new)
@journey_class = journey_class
@journey_history = []
end


def start(station)
    journey_class.journey[:entry_station] = station.name
    journey_class.journey[:entry_zone] = station.zone
end

def finish(station)
  journey_class.journey[:exit_station] = station.name
  journey_class.journey[:exit_zone] = station.zone
end

def history
  @journey_history << @journey_class
end

# def clear_journey_class
#   @journey_class = Journey.new
# end

end
