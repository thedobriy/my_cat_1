# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.create(name: "Больница отдела охраны здоровья УМВС Украины в Одесской области", type_company_id: 1, adress: "Одесса, Кирпичный пер., 3", contacts: "+380 (482) 68-77-47", main_doctor_id: nil, city_id: 2)
Company.create(name: "Городская больница №5", type_company_id: 1, adress: "Одесса, ул. Троицкая, 38", contacts: "+380 (48) 722-13-10", main_doctor_id: 1, city_id: 2)
Company.create(name: "Городская больница №8", type_company_id: 1, adress: "Одесса, Фонтанская дор., 110", contacts: "+380 (482) 63-04-80", main_doctor_id: 4, city_id: 2)
