# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Mark Lennon"
  user.email                 "mpl@gmail.com"
  user.password              "xxxxxx"
  user.password_confirmation "xxxxxx"
end
