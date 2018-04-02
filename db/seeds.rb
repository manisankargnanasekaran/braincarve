User.create!([
{email_id: "superadmin@gmail.com", password: "superadmin", password_confirmation: "superadmin", username: nil},
{email_id: "admin@gmail.com", password: "admin", password_confirmation: "admin", username: nil},
{email_id: "mail2braincarve@gmail.com", password: "braincarve", password_confirmation: "braincarve", username: "braincarve"}
])
Role.create!([
{role_name: "Superadmin", role_code: "1"},
{role_name: "Admin", role_code: "2"}
])
UserRole.create!([
{user_id: 1, role_id: 1},
{user_id: 2, role_id: 2},
{user_id: 3, role_id: 1}
])