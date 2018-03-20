require "rails_helper"
require 'byebug'

RSpec.describe Parser, :type => :model do

  context 'User Story 1. It parses a file into actual account numbers' do 

    it "loads fixtures" do
      expect(fixture("use_case_1")).to match(/123456789\n\z/)
    end

    it "parses an entry into an account number for fixture 000000000.txt" do
      expect(Parser.parse_file('000000000')).to eq('000000000')
    end

    it "parses an entry into an account number for fixture 111111111.txt" do
      expect(Parser.parse_file('111111111')).to eq('111111111')
    end

    it "parses an entry into an account number for fixture 222222222.txt" do
      expect(Parser.parse_file('222222222')).to eq('222222222')
    end

    it "parses an entry into an account number for fixture 333333333.txt" do
      expect(Parser.parse_file('333333333')).to eq('333333333')
    end

    it "parses an entry into an account number for fixture 444444444.txt" do
      expect(Parser.parse_file('444444444')).to eq('444444444')
    end

    it "parses an entry into an account number for fixture 555555555.txt" do
      expect(Parser.parse_file('555555555')).to eq('555555555')
    end

    it "parses an entry into an account number for fixture 666666666.txt" do
      expect(Parser.parse_file('666666666')).to eq('666666666')
    end

    it "parses an entry into an account number for fixture 777777777.txt" do
      expect(Parser.parse_file('777777777')).to eq('777777777')
    end

    it "parses an entry into an account number for fixture 888888888.txt" do
      expect(Parser.parse_file('888888888')).to eq('888888888')
    end

    it "parses an entry into an account number for fixture 999999999.txt" do
      expect(Parser.parse_file('999999999')).to eq('999999999')
    end
  end

  context 'User Story 2.' do 

     it "it calculates the checksum for a given number, and identifies if it is a valid account number." do
      expect(true).to eq(false)
    end
  end

  context 'User Story 3.' do 
     it "It writes out a file. if characters are illegible, they are replaced by a ?. In the case of a wrong checksum, or illegible number, this is noted in a second column indicating status." do
      expect(true).to eq(false)
    end
  end

  context 'User Story 4.' do
     it "When a number comes back as ERR or ILL, guess what it should be." do
      expect(true).to eq(false)
    end
  end

end
