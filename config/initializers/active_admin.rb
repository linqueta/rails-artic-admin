ActiveAdmin.setup do |config|
  config.site_title = "My APP"

  config.default_namespace = false

  config.authentication_method = :authenticate_user!

  config.current_user_method = :current_user

  config.logout_link_path = :destroy_user_session_path

  config.comments = false

  config.batch_actions = true

  config.filter_attributes = [:encrypted_password, :password, :password_confirmation]

  config.localize_format = :long

  config.footer = 'Made by Linqueta'

  meta_tags_options = { viewport: 'width=device-width, initial-scale=1' }
  config.meta_tags = meta_tags_options
  config.meta_tags_for_logged_out_pages = meta_tags_options
end
