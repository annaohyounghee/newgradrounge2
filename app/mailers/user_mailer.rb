class UserMailer < ApplicationMailer
	default from: "contact@gradlounge.io"

	def contact_form(email, name, message)
		@message = message
		mail(from: email,
		to: 'triki.nizar@gmail.com',
		subject: "A new contact form message from #{name}")
	end

end
