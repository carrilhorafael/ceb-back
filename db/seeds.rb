

@add = Address.create(street: "Rua Fas A", number:"12", city: "Niterói", state: "Rio de Janeiro")
User.create(name: "Carlos", cpf:"111.111.111-11", email: "carlos@email.com", phone: "(21)98989-9898", password: "12345678", password_confirmation: "12345678", role: 4, has_validated: true, address_id: @add.id)