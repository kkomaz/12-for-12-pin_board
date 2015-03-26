class ContactForm < MailForm::Base
  attribute :name, :validate => true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :file, :attachment => true
  attribute :message
  attribute :nickname, :captcha => true

  def headers
    {
      :subject => "Contact Form",
      :to => "oclifefitnesstest@gmail.com",
      :from => %("#{name}" <#{email}>) #wtf is this
    }
  end
end
