# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Day.create(day: "Domingo")
Day.create(day: "Segunda")
Day.create(day: "Terça")
Day.create(day: "Quarta")
Day.create(day: "Quinta")
Day.create(day: "Sexta")
Day.create(day: "Sábado")

@add = Address.create(street: "Rua Fas A", number:"12", city: "Niterói", state: "Rio de Janeiro")
User.create(name: "Carlos", cpf:"111.111.111-11", email: "carlos@email.com", phone: "(21)98989-9898", password: "12345678", password_confirmation: "12345678", role: 4, has_validated: true, address_id: @add.id)