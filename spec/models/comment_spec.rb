require "rails_helper"

RSpec.describe Comment, type: :model do 
  describe "db schema" do
    context "columns" do
      it {is_expected.to have_db_column(:content).of_type(:string)}
      it {is_expected.to have_db_column(:user_id).of_type(:integer)}
      it {is_expected.to have_db_column(:post_id).of_type(:integer)}
    end
  end

  describe "associations" do
    it {is_expected.to belong_to(:user)}
    it {is_expected.to belong_to(:post)}
  end
end
