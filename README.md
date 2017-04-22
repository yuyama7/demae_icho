# demae_icho

set up instructions

$ bundle install  
$ rake db:drop db:create db:migrate db:seed RAILS_ENV=development  
$ rails s  

- top http://localhost:3000/
- sign up http://localhost:3000/users/sign_up
- login http://localhost:3000/users/sign_in
- edit prof http://localhost:3000/users/edit
