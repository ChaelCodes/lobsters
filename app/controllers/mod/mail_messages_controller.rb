class Mod::MailMessagesController < ApplicationController
  before_action :set_mod_mail_message, only: %i[ show edit update destroy ]

  # GET /mod_mail_messages
  def index
    @mod_mail_messages = ModMailMessage.all
  end

  # GET /mod_mail_messages/1
  def show
  end

  # GET /mod_mail_messages/new
  def new
    @mod_mail_message = ModMailMessage.new
  end

  # GET /mod_mail_messages/1/edit
  def edit
  end

  # POST /mod_mail_messages
  def create
    @mod_mail_message = ModMailMessage.new(mod_mail_message_params)

    if @mod_mail_message.save
      redirect_to @mod_mail_message.mod_mail, notice: "Mod mail message was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /mod_mail_messages/1
  def update
    if @mod_mail_message.update(mod_mail_message_params)
      redirect_to @mod_mail_message, notice: "Mod mail message was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /mod_mail_messages/1
  def destroy
    @mod_mail_message.destroy!
    redirect_to mod_mail_messages_path, notice: "Mod mail message was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mod_mail_message
      @mod_mail_message = ModMailMessage.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def mod_mail_message_params
      params.expect(mod_mail_message: [ :mod_mail_id, :message, :user_id ])
    end
end
