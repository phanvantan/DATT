 User.create!(name: "user",
              email: "user@gmail.com",
              password: "123456",
              password_confirmation: "123456",
              role: 1,
              activated: true,
              activated_at: Time.zone.now)
