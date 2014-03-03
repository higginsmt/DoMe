require 'spec_helper'

describe Activity do
  describe "associations" do
    it { should belong_to :creator }
    it { should have_many :adventures }
    it { should have_many(:completed_users).through(:adventures) }
  end
end
