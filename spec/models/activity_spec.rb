require 'spec_helper'

describe Activity do
  describe "associations" do
    it { should belong_to :user }
    it { should have_many :adventures }
  end
end
