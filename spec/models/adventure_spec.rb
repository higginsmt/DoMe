require 'spec_helper'

describe Adventure do
  it { should belong_to :user }
  it { should belong_to :activity}
  it { should have_one :story }
end
