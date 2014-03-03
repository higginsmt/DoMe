require 'spec_helper'

describe Adventure do
  it { should belong_to :user }
  it { should belong_to :activity}
end
