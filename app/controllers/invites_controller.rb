class InvitesController < ApplicationController
  def create
    mandrill = Mandrill::API.new ENV["MANDRILL_API_KEY"]

    name = params[:name]
    email = params[:email]
    email_array = params[:list]
    @link = params[:link]
    @text = params[:text]
    @greeting = params[:greeting]
    @text2 = params[:text2]
    @image = params[:image]



    email_array.each do |send|

      invites_template = to_invites(binding)

    message = {
        html: invites_template,
        subject: "#{name} invites you to subscribe!",
        from_email: email,
        to: [{email: send}]
    }


    mandrill.messages.send message
    end
    render json: { message: "Thanks for sharing!" }, status: :ok

  end

  private
  def to_invites(controller_binding)
    template_path = Rails.root.join("app", "views", "invites", "invites_template.html.erb")
    html = File.open(template_path).read
    template = ERB.new(html)
    template.result(controller_binding)
  end
end
