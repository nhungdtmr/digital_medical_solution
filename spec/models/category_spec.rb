require "rails_helper"

RSpec.describe Category, type: :model do
  describe "db schema" do 
    context "columns" do
      it {is_expected.to have_db_column(:name).of_type(:string)}
    end
  end

  describe "associations" do
    it {is_expected.to have_many(:posts)}
  end
end
