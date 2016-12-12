require 'rails_helper'
require 'spec_helper'

# RSpec.describe User, type: :model do
#
#   it { should validate_presence_of(:username) }
#   it { should validate_presence_of(:password_digest) }
#   it { should validate_length_of(:password).is_at_least(6) }
#
#   # associations
#   it { should have_many(:subs) }
#   it { should have_many(:user_votes) }
#   it { should have_many(:comments) }
#
#
# end

describe User do
  subject(:user) do
    FactoryGirl.build(:user,
      username: "jonathan",
      password: "good_password")
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should have_many(:subs) }
  # it { should have_many(:user_votes) }
  # it { should have_many(:comments) }
end
