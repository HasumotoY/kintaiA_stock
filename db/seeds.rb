User.create!(name: "管理者", email: "admin@email.com",
            password: "password", password_confirmation: "password",
            employee_number: 1, uid: "0001",
            admin: true)

User.create!(name: "上長A", email: "superior1@email.com",
            password: "password", password_confirmation: "password",
            employee_number: 2, uid: "0002",
            superior: true)
            
User.create!(name: "上長B", email: "superior2@email.com",
            password: "password", password_confirmation: "password",
            employee_number: 3, uid: "0003",
            superior: true)
            
58.times do |n|
  name = Faker::Name.name
  email= "sample#{n+1}@email.com"
  password= "password"
  employee_number = 4+n
  uid = "#{0004+n}"
  
  User.create!(name: name,email: email, password: password,
              password_confirmation: password, employee_number: employee_number,
              uid: uid)
end