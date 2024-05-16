class SendEmailWorker
    include Sidekiq::Worker
  
    def perform(email, subject, body)
      # Logic for sending email
      UserMailer.send_email(email, subject, body).deliver_now
    end
  end
  