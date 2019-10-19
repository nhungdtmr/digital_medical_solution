require "rails_helper"

RSpec.describe Post, type: :model do
  describe "db schema" do
    context "columns" do
      it {is_expected.to have_db_column(:title).of_type(:string)}
      it {is_expected.to have_db_column(:content).of_type(:string)}
      it {is_expected.to have_db_column(:thumbnail).of_type(:string)}
      it {is_expected.to have_db_column(:user_id).of_type(:integer)}
      it {is_expected.to have_db_column(:category_id).of_type(:integer)}
    end
  end

  describe "associations" do
    it {is_expected.to belong_to(:user)}
    it {is_expected.to belong_to(:category)}
    it {is_expected.to have_many(:comments)}
    it {is_expected.to have_many(:emotions)}
  end
end

