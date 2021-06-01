class AssignMailer < ApplicationMailer
  default from: 'from@example.com'

  def assign_mail(email, password)
    @email = email
    @password = password
    mail to: @email.split(","), subject: I18n.t('views.messages.complete_registration')
  end

  def delete_assign_mail(agenda)
    @agenda = agenda
    @emails = @agenda.team.members.pluck(:email)
    # @emails = users.pluck(:email)
    mail to: @emails.split(","), subject: I18n.t('views.messages.delete_agenda')
  end
end