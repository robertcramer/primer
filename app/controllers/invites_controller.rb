class InvitesController < ApplicationController
  def create
    mandrill = Mandrill::API.new ENV["MANDRILL_API_KEY"]

    name = params[:name]
    email = params[:email]
    email_string = params[:list]
    email_array = email_string.split(',')

    email_array.each do |send|

    message = {
        text: params[:text],
        subject: "#{name} invites you to subscribe!",
        from_email: email,
        to: [{email: send}]
    }


    mandrill.messages.send message
    end
    render json: { message: "Thanks for sharing!" }, status: :ok

  end
end
