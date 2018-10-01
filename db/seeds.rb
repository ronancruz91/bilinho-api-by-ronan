# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do
	Instituicao.create({
		nome: Faker::University.name,
		tipo: 'Universidade',
		cnpj: Faker::IDNumber.valid
	})
end

50.times do
	Aluno.create({
		nome: Faker::Name.name_with_middle,
		cpf: Faker::Number.number(10),
		data_nascimento: Faker::Date.birthday(18, 65),
		telefone: Faker::Number.number(10),
		genero: ['M','F'].sample,
		meio_pagamento: ['Boleto','Cartão'].sample
	})
end
