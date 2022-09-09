# frozen_string_literal: true

class User < ApplicationRecord
  include UserInfoConcern

  validates  :name, :email, presence: true
  validate  :check_for_valid_user

  validates :gender, inclusion: { in: %w[female male other xyz], allow_blank: true }

  validates :active, inclusion: { in: [true, false] }

  has_many :articles
  has_many :likes

  before_create :generate_uid
  before_validation :add_prefix_to_name

  # after_save  :send_user_profile_update_alert
  # after_save  :send_user_profile_update_alert, if: :can_trigger_save_callback?
  # after_save  :send_an_email_alert, if: :email_previously_changed?
  # after_save  :send_sms_alert, if: :phone_previously_changed?

  # after_commit  :send_user_profile_update_alert, on: :create
  # after_commit  :send_sms_alert, on: :update
  # after_commit  :send_destroy_alert, on: :destroy
  # after_commit  :send_user_profile_update_alert

  def check_for_valid_user
    puts '==================in check_for_valid_user======='
    return if Article.where(read: true).count > 5

    # Adding some error message to record, raise manual exception here
    errors.add(:base, 'Article read count is less than 5')
    # or
    errors.add(:name, 'Article read count is less than 5')
    errors.add(:email, 'Article read count is less than 5')
  end

  def send_destroy_alert
    puts '==================send_destroy_alert:::====='
  end

  def can_trigger_save_callback?
    # based on requirement, we can add our conditions
    Article.count.positive?
  end

  def send_user_profile_update_alert # create, update, destroy
    puts "================INN send_user_profile_update_alert==destroyed?::#{destroyed?}"
    return if destroyed?

    send_an_email_alert
    send_sms_alert
  end

  def send_an_email_alert
    puts '==========BEOFRE INNN send_an_email_alert'
    puts "========#{inspect}============"
    return if email.blank? # NULL exception

    puts "========#{email}============"
    puts "========#{phone}============"

    # business logic will come here: calling email service
    # ApplicationMailer.send_an_email_alert(id).deliver_now
    # ApplicationMailer.send_an_email_alert(id).deliver_later
    puts '==========AFTER INNN send_an_email_alert'
  end

  def send_sms_alert
    puts '==========BEFORE INNN send_sms_alert'
    return if phone.blank?

    # business logic will come here: calling sms service
    puts '==========AFTER INNN send_sms_alert'
  end

  def generate_uid
    return if uid

    token = nil
    loop do
      token = SecureRandom.hex(13)
      break if User.where(uid: token).count.zero?
    end
    self.uid = token
  end

  def add_prefix_to_name
    return if name.blank?

    return if name.starts_with?('MVC-')

    self.name = 'MVC- ' + name
  end
end
