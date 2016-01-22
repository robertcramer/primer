class InvitesController < ApplicationController
  def create
    mandrill = Mandrill::API.new ENV["MANDRILL_API_KEY"]

    name = params[:name]
    email = params[:email]

    message = {
        text: params[:text],
        subject: "#{name} invites you to subscribe!",
        from_email: email,
        to: [{email: "robertbcramer@icloud.com"}]
    }

    mandrill.messages.send message
  end
end
