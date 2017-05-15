# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

addr_array = ["3430 Executive Pointe Way Carson City, NV 89706",
"361 Saxton Drive Miami Beach, FL 33139",
"70 Bayberry Lane Mcminnville, TN 37110",
"637 South Lake Forest Ave. Euless, TX 76039",
"537 Greenview Dr. Cleveland, TN 37312",
"314 South Monroe Avenue Princeton, NJ 08540",
"8172 Center Drive Irvington, NJ 07111",
"10 Rockledge Dr. Minneapolis, MN 55406",
"63 Old Tarkiln Hill Dr. Reno, NV 89523",
"819 Halifax St. Hollywood, FL 33020",
"63 Shady Dr. Jonesboro, GA 30236",
"9979 Greenview St. Fort Lauderdale, FL 33308",
"7 Highland Drive Maineville, OH 45039",
"7698 Gulf Street Ormond Beach, FL 32174",
"847 6th Rd. Grayslake, IL 60030",
"373 Anderson Road Wilkes Barre, PA 18702",
"9850 Hillcrest Lane Germantown, MD 20874",
"74 Pin Oak Dr. Brownsburg, IN 46112",
"8467 Applegate Lane Mentor, OH 44060",
"9297 Pennsylvania Road North Miami Beach, FL 33160"]

20.times do |a|
  a = Appointment.create(
      subject: Faker::Hipster.sentence(5),
      description: Faker::Hipster.paragraph(2),
      date: Faker::Time.forward(30, :day).strftime('%F'),
      start_time: Faker::Time.forward(30, :day).strftime("%H:%M:%S"),
      address:  addr_array.sample,
    )
    a.services.create(title: Faker::Ancient.god, description: Faker::Hacker.say_something_smart)
    a.services.create(title: Faker::Ancient.god, description: Faker::Hacker.say_something_smart)
    a.services.create(title: Faker::Ancient.god, description: Faker::Hacker.say_something_smart)
end

