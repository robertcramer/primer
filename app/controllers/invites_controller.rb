class InvitesController < ApplicationController
  def create
    mandrill = MANDRILL_API

    message = {
        text: "testing 123",
        subject: "this is a test!",
        from_email: "andrewkfaircloth@gmail.com",
        to: [{email: "robertbcramer@icloud.com"}]
    }

    mandrill.messages.send message
  end
end
