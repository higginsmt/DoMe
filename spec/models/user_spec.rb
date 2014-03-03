require 'spec_helper'

describe User do
  it { should have_many :adventures }
  it { should have_many(:activities).through(:adventures) }
  it { should have_many(:stories) }
end
