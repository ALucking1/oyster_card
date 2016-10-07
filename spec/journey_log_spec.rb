require 'journey_log'

describe JourneyLog do
  subject(:journey_log) {described_class.new}
  let(:start_station) { double :start_station, :name => "Kings X", :zone => 2}
  let(:end_station) { double :end_station, :name => "Liverpool", :zone => 1}

  #let(:journey_class) {Journey.new}

  # it 'starts a journey' do
  #
  #   expect(journey_log.journey_class).to eq journey_class
  # end


    describe '#start' do

      it 'has an entry station when the journey is started' do
        journey_log.start(start_station)
        expect(journey_log.journey_class.journey[:entry_station]).to eq "Kings X"
      end

      it 'has and entry zone when the journey is started' do
        journey_log.start(start_station)
        expect(journey_log.journey_class.journey[:entry_zone]).to eq 2
      end
    end

    describe '#finish' do

      it 'has an exit station when the journey is finished' do
        journey_log.finish(end_station)
        expect(journey_log.journey_class.journey[:exit_station]).to eq "Liverpool"
      end

      it 'has an exit zone when the journey is finished' do
        journey_log.finish(end_station)
        expect(journey_log.journey_class.journey[:exit_zone]).to eq 1
      end
    end


end
