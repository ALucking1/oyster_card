 require_relative 'station'

class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :journey, :entry_station, :entry_zone, :exit_station, :exit_zone

  def initialize
    @journey = {:entry_station => nil, :entry_zone => nil, :exit_station => nil, :exit_zone => nil}
  end

  def complete?
    !(@journey[:exit_station] && @journey[:entry_station]).nil?
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
  end
end
