# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Doctor.create(name: "Прохорова Алла Николаевна", company_id: 2, speciality_id: 2, desc: "Главный врач")
Doctor.create(name: "Дмитриев Игорь Борисович", company_id: 2, speciality_id: 1, desc: "Врач-физиотерапевт")
Doctor.create(name: "Сидоров Григорий Михайлович", company_id: 2, speciality_id: 1, desc: "Заведующий кабинетом ФД")
Doctor.create(name: "Бобкова Мария Евгеньевна", company_id: 3, speciality_id: 2, desc: "главврач")
Doctor.create(name: "Червоненко Людмила Григорьевна", company_id: 3, speciality_id: 2, desc: "заместитель по амбулаторно-поликлинической работе")
Doctor.create(name: "Мазур Елена Борисовна", company_id: 3, speciality_id: 2, desc: "заместитель по медицинской части")
Doctor.create(name: "Козак Валентина Алексеевна", company_id: 3, speciality_id: 2, desc: "заместитель по экспертизе временной нетрудоспособности")
Doctor.create(name: "Маслова Ирина Леонидовна", company_id: 3, speciality_id: 2, desc: "заместитель по экономическим вопросам")
