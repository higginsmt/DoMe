require 'spec_helper'

describe User do
  it { should have_many :adventures }
  it { should have_many :created_activities }
  it { should have_many(:completed_activities).through(:adventures) }
end
