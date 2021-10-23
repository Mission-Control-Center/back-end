# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'firstUser', email: 'seed@user.com', password: 'soy beans')
app_config = AppConfig.create(version: '2.0')

permission = Permission.create([{ name: 'View' }, { name: 'Edit' }, { name: 'Share' }])
role = Role.create([{ name: 'Dev' }, { name: 'Manager' }, { name: 'CEO' }])

RolePermission.create(permission_id: permission.first.id, role_id: role.first.id)

AppRole.create(app_config_id: app_config.id, role_id: role.first.id)