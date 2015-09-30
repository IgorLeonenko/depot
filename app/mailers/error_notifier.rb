class ErrorNotifier < ApplicationMailer
  default from: 'Leon <depot@example.com>'

  def error(e)
    @error = e

    mail to: "igrleon@gmail.com", subject: "Error in depot"
  end
end