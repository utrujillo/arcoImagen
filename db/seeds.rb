# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  email: 'uziel.trujillo@gmail.com',
  password: 'yasabes123',
  encrypted_password: '$2a$10$aLGWt1IAsIPLelseWdCv1e9QF8dt/D82JGEVsfZcLhqLuLJDi9o5u', #universal123
  nombre: 'Uziel',
  apellidos: 'Trujillo Colón',
)
