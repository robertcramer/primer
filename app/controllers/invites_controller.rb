class InvitesController < ApplicationController
  def create
    mandrill = Mandrill::API.new ENV["MANDRILL_API_KEY"]

    name = params[:name]

    message = {
        text: params[:text],
        subject: "#{name} invites you to subscribe!",
        from_email: "andrewkfaircloth@gmail.com",
        to: [{email: "robertbcramer@icloud.com"}]
    }

    mandrill.messages.send message
  end
end
