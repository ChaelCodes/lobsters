class Mod::MailsController < Mod::ModController
  before_action :set_mod_mail, only: %i[ show edit update destroy ]

  # GET /mod_mails
  def index
    @mod_mails = ModMail.all
  end

  # GET /mod_mails/1
  def show
    @new_mod_mail_message = ModMailMessage.new(user: @user, mod_mail: @mod_mail)
    @messages = @mod_mail.mod_mail_messages.order(:created_at)
  end

  # GET /mod_mails/new
  def new
    @mod_mail = ModMail.new
  end

  # GET /mod_mails/1/edit
  def edit
  end

  # POST /mod_mails
  def create
    @mod_mail = ModMail.new(mod_mail_params)
    @mod_mail.recipients = User.where(username: params["mod_mail"]["recipient_usernames"].split(' ')) if params["mod_mail"]["recipient_usernames"].present?

    if @mod_mail.save
      redirect_to @mod_mail, notice: "Mod mail was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /mod_mails/1
  def update
    if @mod_mail.update(mod_mail_params)
      redirect_to @mod_mail, notice: "Mod mail was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /mod_mails/1
  def destroy
    @mod_mail.destroy!
    redirect_to mod_mails_path, notice: "Mod mail was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mod_mail
      @mod_mail = ModMail.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def mod_mail_params
      params.expect(mod_mail: [:subject, :recipients, :references])
    end
end
