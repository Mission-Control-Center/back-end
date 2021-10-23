# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_one = User.create(username: 'firstUser', email: 'seed@user.com', password: 'soy beans')
user_two = User.create(username: 'secondUser', email: 'seedTwo@user.com', password: 'peanut butter')
app_config = AppConfig.create(version: '2.0')

permission = Permission.create([{ name: 'View' }, { name: 'Edit' }, { name: 'Share' }])
role = Role.create([{ name: 'Dev' }, { name: 'Manager' }, { name: 'CEO' }])

RolePermission.create(permission_id: permission.first.id, role_id: role.first.id)

AppRole.create(app_config_id: app_config.id, role_id: role.first.id)

AppMetaInfo.create(name: 'MCC', owner_id: user_one.id, manager_id: user_two.id, app_config_id: app_config.id)
