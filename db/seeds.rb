# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts "new seed"
puts "T1 Customer  = #{T1Customer.count}"
puts "User count  = #{User.count}"
puts "LoadIn = #{LoadIn.count}"
puts "Packer = #{Packer.count}"
puts "InAssignment = #{InAssignment.count}"
puts "LoadIn = #{LoadOut.count}"
puts "Recipient = #{Recipient.count}"
puts "OutAssignment = #{OutAssignment.count}"
puts '---------- deleting all records ----------'
User.destroy_all
# T1CustomerAddress.destroy_all
T1Customer.destroy_all

LoadIn.destroy_all
# PackerAddress.destroy_all
Packer.destroy_all
InAssignment.destroy_all
LoadIn.destroy_all
# RecipientAddress.destroy_all
Recipient.destroy_all





packer = ['N-950',
            'T-436',
            'T-470',
            'F-430',
            'H-112']
truck_nr_in = ['DR 48417','60 VP 85', 'XM 97350','PB 5274 CT','PB 5277 CT']
trailer_nr_in = ['48417','6085', '97350','5274','5274']

truck_nr_out = ['DR 48418','60 VP 86', 'XM 97351','PB 5275 CT','PB 5278 CT']
trailer_nr_out = ['48418','6086', '97351','5275','5278']

status_loadin = ['IN', 'OUT']
status_loadout = ['DELIVERED', 'NOT DELIVERED']

type_of_service = [ 'TRUCK TO TRUCK',
            'TRUCK TERMINAL TRUCK',
            'PICKING']
number_of_boxe_in = [891, 300, 700]
number_of_pallet_in = [33, 12, 26]
net_weight = [1500, 700, 1000]
cost = [15000, 7000, 10000]
div_cost = [0, 1000, 0]

recipient = ['NEW ENGLAND', 'ATLANTIK', 'FRATELLI', 'COMP', 'PROFISH FOOD']
1.times do
  recipient_attributes = {
    name: "UDISP",
    email: "terminal1@mail.com"
  }
  recipient_address_attributes = {
    street: "Terminal1"
  }
  recipient_created = Recipient.create(recipient_attributes)
  recipient_created.build_address(recipient_address_attributes).save!
end


puts "---------- seeding ----------"




t1_customer1 = T1Customer.create(name: 'Terminal1')
t1_customer1_address_attributes = {

    street: Faker::Address.street_name,
    street_nr: (rand(1..20)).to_s,
    postcode: Faker::Address.zip_code,
    city: Faker::Address.city,
    country: Faker::Address.country,
    phone_nr: Faker::PhoneNumber.phone_number,

  }
t1_customer1.build_address(t1_customer1_address_attributes).save!

t1_customer2 = T1Customer.create(name: 'N&K')
t1_customer2_address_attributes = {

    street: Faker::Address.street_name,
    street_nr: (rand(1..20)).to_s,
    postcode: Faker::Address.zip_code,
    city: Faker::Address.city,
    country: Faker::Address.country,
    phone_nr: Faker::PhoneNumber.phone_number,

  }
t1_customer2.build_address(t1_customer2_address_attributes).save!

t1_customer3 = T1Customer.create(name: 'CERMAQ')
t1_customer3_address_attributes = {

    street: Faker::Address.street_name,
    street_nr: (rand(1..20)).to_s,
    postcode: Faker::Address.zip_code,
    city: Faker::Address.city,
    country: Faker::Address.country,
    phone_nr: Faker::PhoneNumber.phone_number,

  }
t1_customer3.build_address(t1_customer3_address_attributes).save!

t1_customer4 = T1Customer.create(name: 'INTERCARGO')
t1_customer4_address_attributes = {

    street: Faker::Address.street_name,
    street_nr: (rand(1..20)).to_s,
    postcode: Faker::Address.zip_code,
    city: Faker::Address.city,
    country: Faker::Address.country,
    phone_nr: Faker::PhoneNumber.phone_number,

  }
t1_customer4.build_address(t1_customer4_address_attributes).save!

t1_customer5 = T1Customer.create(name: 'POLAR QUALITY')
t1_customer5_address_attributes = {

    street: Faker::Address.street_name,
    street_nr: (rand(1..20)).to_s,
    postcode: Faker::Address.zip_code,
    city: Faker::Address.city,
    country: Faker::Address.country,
    phone_nr: Faker::PhoneNumber.phone_number,

  }
t1_customer5.build_address(t1_customer5_address_attributes).save!
puts "T1 Customer  = #{T1Customer.count}"

user = User.create(email: 'test@test.as', password: 'test123',t1_customer_id: t1_customer1.id, admin: true)
user2 = User.create(email: 't1_customer2@test.as', password: 'test123',t1_customer_id: t1_customer2.id)
user3 = User.create(email: 't1_customer3@test.as', password: 'test123',t1_customer_id: t1_customer3.id)
user4 = User.create(email: 't1_customer4@test.as', password: 'test123',t1_customer_id: t1_customer4.id)
user5 = User.create(email: 't1_customer5@test.as', password: 'test123',t1_customer_id: t1_customer5.id)
puts "User count  = #{User.count}"


puts "---------- creating Loadins ----------"
counter = 0
1000.times do
loadin_attributes = {
  t1_customer_id: rand(2..5),
  status: status_loadin[rand(0..1)],
  arrival_date: Time.new(2020, 1, 3),
  truck_nr: truck_nr_in[rand(0..4)],
  trailer_nr: trailer_nr_in[rand(0..4)],
  type_of_service: type_of_service[rand(0..2)],
  reference: "#{counter + 1}-LI"

  }

  LoadIn.create(loadin_attributes)
  counter += 1
  puts counter
  puts "LoadIn = #{LoadIn.count}"

end


puts "---------- creating Packers ----------"
counter = 0
5.times do
  packer_attributes = {

    packer_nr: packer[counter],
    name: Faker::Company.name

  }

  packer_address_attributes = {

    street: Faker::Address.street_name,
    street_nr: (rand(1..20)).to_s,
    postcode: Faker::Address.zip_code,
    city: Faker::Address.city,
    country: Faker::Address.country,
    phone_nr: Faker::PhoneNumber.phone_number,

  }

  packer_creation = Packer.create(packer_attributes)
  packer_creation.build_address(packer_address_attributes).save!
  counter += 1
  puts counter
end


puts "---------- creating Recipients ----------"
counter = 0

5.times do
  recipient_attributes = {

    name: recipient[counter],
    email: "#{recipient[counter].downcase}@mail.com"

  }

  recipient_address_attributes = {

    street: Faker::Address.street_name,
    street_nr: (rand(1..20)).to_s,
    postcode: Faker::Address.zip_code,
    city: Faker::Address.city,
    country: Faker::Address.country,
    phone_nr: Faker::PhoneNumber.phone_number,

  }

  recipient_created = Recipient.create(recipient_attributes)
  recipient_created.build_address(recipient_address_attributes).save!
  counter += 1
  puts counter
end



puts "---------- creating IN Assignments ----------"
counter = 0

1000.times do
in_assignment_attributes = {
  load_in_id: counter + 1,
  packer: packer[rand(0..4)],
  recipient_id: rand(2..5),
  lot_nr: "LOT-#{counter + 1 }",
  incoming_order_ref: "INCO-#{counter + 1 }",
  other_ref: "OTHER-#{counter + 1 }",
  number_of_boxe: seed_box = number_of_boxe_in[rand(0..2)],
  number_of_pallet: number_of_pallet_in[rand(0..2)],
  net_weight: seed_box * 10,
   reference: "#{counter + 1}-INA",
   }


  assignment = InAssignment.create(in_assignment_attributes)
  p in_assignment_attributes
  p assignment

  load_in = LoadIn.find_by(id: assignment.load_in_id)
  p load_in
  p " hello In assignment 2 #{assignment.net_weight}"
  load_in.total_weight = assignment.net_weight
  load_in.save!

  counter += 1
  puts " counter #{counter}"
end


puts "---------- creating Loadouts ----------"
counter = 0

1000.times do
loadout_attributes = {
  t1_customer_id: rand(2..5),
  status: status_loadout[rand(0..1)],
  departure_date: Time.new(2020, 1, 4),
  truck_nr: truck_nr_out[rand(0..4)],
  trailer_nr: trailer_nr_out[rand(0..4)],
  reference: "#{counter + 1}-LO"
}

  LoadOut.create(loadout_attributes)
  counter += 1
  puts counter
end

puts "---------- creating OUT Assignments ----------"
counter = 0

1000.times do
out_assignment_attributes = {
  load_out_id: counter + 1,
  recipient_id: rand(2..5),
  lot_nr: "LOT-#{counter + 1 }",
  other_ref: "OTHER-#{counter + 1 }",
  number_of_boxe: number_of_boxe_in[rand(0..2)],
  number_of_pallet: number_of_pallet_in[rand(0..2)],
  net_weight: net_weight[rand(0..2)],
  cost: cost[rand(0..2)],
  div_cost: div_cost[rand(0..2)],
  reference: "#{counter + 1}-OUTA"

   }

assignment = OutAssignment.create(out_assignment_attributes)
  load_out = LoadOut.find_by(id: assignment.load_out_id)
  p "load_out #{load_out}"
  load_out.total_weight = assignment.net_weight
  load_out.save!

  counter += 1
  puts counter
end

puts "---------- creating Assignments ----------"
counter = 0

1000.times do
assignment_attributes = {
  in_assignment_id: counter + 1,
  out_assignment_id: counter + 1
   }

  Assignment.create!(assignment_attributes)
  counter += 1
  puts counter
end



puts "---------- seeding done ----------"

puts "T1 Customer  = #{T1Customer.count}"
puts "User count  = #{User.count}"
puts "LoadIn = #{LoadIn.count}"
puts "Packer = #{Packer.count}"
puts "InAssignment = #{InAssignment.count}"
puts "LoadOut = #{LoadOut.count}"
puts "Recipient = #{Recipient.count}"
puts "OutAssignment = #{OutAssignment.count}"
puts "Assignment = #{Assignment.count}"

