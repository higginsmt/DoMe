require 'spec_helper'

describe Story do
  it { should belong_to :user }
  it { should belong_to :adventure }
  it { should belong_to :activity }
end
