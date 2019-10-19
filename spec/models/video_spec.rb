require "rails_helper"

RSpec.describe Video, type: :model do
  describe "db schema" do
    context "columns" do
      it {is_expected.to have_db_column(:video_url).of_type(:string)}
      it {is_expected.to have_db_column(:user_id).of_type(:integer)}
    end
  end

  describe "associations" do
    it {is_expected.to belong_to(:user)}
  end
end
