require 'rails_helper'

RSpec.describe "IxamsController", type: :request do
  let(:valid_attributes) {
     { name: "First Exam" }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Ixam.create! valid_attributes
      get ixams_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      ixam = Ixam.create! valid_attributes
      get ixam_url(ixam)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_ixam_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      ixam = Ixam.create! valid_attributes
      get edit_ixam_url(ixam)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Ixam" do
        expect {
          post ixams_url, params: { ixam: valid_attributes }
        }.to change(Ixam, :count).by(1)
      end

      it "redirects to the created ixam" do
        post ixams_url, params: { ixam: valid_attributes }
        expect(response).to redirect_to(ixam_url(Ixam.last))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "First Exam" }
      }

      it "updates the requested ixam" do
        ixam = Ixam.create! valid_attributes
        patch ixam_url(ixam), params: { ixam: new_attributes }
        ixam.reload
      end

      it "redirects to the ixam" do
        ixam = Ixam.create! valid_attributes
        patch ixam_url(ixam), params: { ixam: new_attributes }
        ixam.reload
        expect(response).to redirect_to(ixam_url(ixam))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested ixam" do
      ixam = Ixam.create! valid_attributes
      expect {
        delete ixam_url(ixam)
      }.to change(Ixam, :count).by(-1)
    end

    it "redirects to the ixams list" do
      ixam = Ixam.create! valid_attributes
      delete ixam_url(ixam)
      expect(response).to redirect_to(ixams_url)
    end
  end
end

