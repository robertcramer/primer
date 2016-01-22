class InvitesController < ApplicationController
  def create
    mandrill = Mandrill::API.new ENV["MANDRILL_API_KEY"]

    message = {
        text: params[:text],
        subject: params[:subject],
        from_email: "andrewkfaircloth@gmail.com",
        to: [{email: "robertbcramer@icloud.com"}]
    }

    mandrill.messages.send message
  end
end
