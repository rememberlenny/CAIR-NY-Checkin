require 'rails_helper'

describe Account, :type => :model do
  let(:account) {FactoryGirl.build(:account)}
  skip "add some examples to (or delete) #{__FILE__}"
  # todo: check loading of oath_data and default_scope
end

