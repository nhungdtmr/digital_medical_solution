require "rails_helper"

RSpec.describe User, type: :model do
  describe "db schema" do
    context "columns" do
      it {is_expected.to have_db_column(:name).of_type(:string)}
      it {is_expected.to have_db_column(:email).of_type(:string)}
      it {is_expected.to have_db_column(:avatar).of_type(:string)}
      it {is_expected.to have_db_column(:address).of_type(:string)}
      it {is_expected.to have_db_column(:phone_number).of_type(:string)}
      it {is_expected.to have_db_column(:role).of_type(:integer)}
    end
  end

  describe "associations" do 
    it {is_expected.to have_many (:posts)}
    it {is_expected.to have_many(:comments)}
    it {is_expected.to have_many(:emotions)}
    it {is_expected.to have_many(:videos)}
  end
end
