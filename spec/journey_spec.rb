require 'journey'

describe Journey do
  subject(:tube_journey) {described_class.new}
  let(:start_station) { double :start_station, :name => "Kings X", :zone => 2}
  let(:end_station) { double :end_station, :name => "Liverpool", :zone => 1}

  describe '#complete' do

    it 'should tell us if a journey is complete' do
      tube_journey.journey[:entry_station] = start_station
      tube_journey.journey[:exit_station] = end_station
      expect(tube_journey.complete?).to be true
    end

    it 'should tell us if a journey is incomplete due to not touching in' do
      tube_journey.journey[:exit_station] = end_station
      expect(tube_journey.complete?).to be false
    end

    it 'should tell us if a journey is incomplete due to not touching out' do
      tube_journey.journey[:entry_station] = start_station
      expect(tube_journey.complete?).to be false
    end
  end

  describe '#fare' do

    it 'returns the correct fare if journey is complete' do
      tube_journey.journey[:entry_station] = start_station
      tube_journey.journey[:exit_station] = end_station
      tube_journey.journey[:entry_zone] = start_station.zone
      tube_journey.journey[:exit_zone] = end_station.zone
      expect(tube_journey.fare).to eq ((start_station.zone - end_station.zone).abs + 1)
    end

    it 'returns a penalty fare when touching out without thouching in' do
      tube_journey.journey[:exit_station] = end_station
      expect(tube_journey.fare).to eq Journey::PENALTY_FARE
    end

    it 'returns a penalty fare when touching in without thouching out' do
      tube_journey.journey[:entry_station] = start_station
      expect(tube_journey.fare).to eq Journey::PENALTY_FARE
    end
  end
end
