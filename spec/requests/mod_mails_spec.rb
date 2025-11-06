require 'rails_helper'

RSpec.describe "/mod/mails", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # ModMail. As you add validations to ModMail, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      subject: "Moderation Mail Subject"
    }
  end

  let(:invalid_attributes) { {} }

  describe "GET /index" do
    it "renders a successful response" do
      ModMail.create! valid_attributes
      get mod_mails_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      mod_mail = ModMail.create! valid_attributes
      get mod_mail_url(mod_mail)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_mod_mail_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      mod_mail = ModMail.create! valid_attributes
      get edit_mod_mail_url(mod_mail)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ModMail" do
        expect {
          post mod_mails_url, params: { mod_mail: valid_attributes }
        }.to change(ModMail, :count).by(1)
      end

      it "redirects to the created mod_mail" do
        post mod_mails_url, params: { mod_mail: valid_attributes }
        expect(response).to redirect_to(mod_mail_url(ModMail.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ModMail" do
        expect {
          post mod_mails_url, params: { mod_mail: invalid_attributes }
        }.to change(ModMail, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post mod_mails_url, params: { mod_mail: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested mod_mail" do
        mod_mail = ModMail.create! valid_attributes
        patch mod_mail_url(mod_mail), params: { mod_mail: new_attributes }
        mod_mail.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the mod_mail" do
        mod_mail = ModMail.create! valid_attributes
        patch mod_mail_url(mod_mail), params: { mod_mail: new_attributes }
        mod_mail.reload
        expect(response).to redirect_to(mod_mail_url(mod_mail))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        mod_mail = ModMail.create! valid_attributes
        patch mod_mail_url(mod_mail), params: { mod_mail: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested mod_mail" do
      mod_mail = ModMail.create! valid_attributes
      expect {
        delete mod_mail_url(mod_mail)
      }.to change(ModMail, :count).by(-1)
    end

    it "redirects to the mod_mails list" do
      mod_mail = ModMail.create! valid_attributes
      delete mod_mail_url(mod_mail)
      expect(response).to redirect_to(mod_mails_url)
    end
  end
end
