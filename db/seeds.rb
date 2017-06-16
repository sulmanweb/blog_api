User.create(email: Rails.application.secrets.admin_email, password: Rails.application.secrets.admin_password, user_type: Rails.configuration.constants['user_type_admin'])
p 'seeding done!'
