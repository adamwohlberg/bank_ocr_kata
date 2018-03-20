require "rails_helper"
require 'byebug'

RSpec.describe Parser, :type => :model do
  it "loads fixtures" do
    expect(fixture("use_case_1")).to match(/123456789\n\z/)
  end

  it "parses an entry into an account number" do
    
  end
end
