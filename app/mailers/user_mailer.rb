class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirm.subject
  #
  def confirm
    @user = params[:user]

    mail(to: @user.email, subject:"Bem vindo ao Comes&Bebes")
  end
  def has_created
    @user = params[:user]

    mail(to: @user.email, subject:"Você foi cadastrado no Comes&Bebes")
  end
  def forgot
    @user = params[:user]

    mail(to: @user.email, subject:"Esqueci minha senha no Comes&Bebes")
  end
  def repeat_token
    @user = params[:user]

    mail(to: @user.email, subject:"Confirme sua conta no Comes&Bebes")
  end
end
