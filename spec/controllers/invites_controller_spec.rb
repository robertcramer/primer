require "rails_helper"

RSpec.describe InvitesController, :type => :controller do
  describe "POST #create" do
    it "renders thanks you for sharing if successfull" do
      post :create
      expect(response).to be_success
      expect(response).to have_rendered(message: "Thanks for sharing!")
    end
  end
end