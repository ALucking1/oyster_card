require_relative 'journey'
require_relative 'journey_log'

class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journey_history, :journey_log, :in_use
  MAXIMUM_LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize(balance=0)
    @balance = balance
    @in_use = false
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    raise "The maximum top up value of #{MAXIMUM_LIMIT} has been reached!" if @balance + amount > MAXIMUM_LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds" if @balance < MINIMUM_BALANCE
    @journey_log.start(station)
    @in_use = true
  end

  def in_journey?
    @in_use
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct(@journey_log.journey_class.fare)
    @in_use = false
    @journey_log.history
    @journey_log.clear_journey_class
  end


private

  def deduct(amount)
    @balance -= amount
  end
end
