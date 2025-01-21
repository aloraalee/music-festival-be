# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

alora = User.find_or_create_by!(first_name: "Alora", last_name: "Coolgirl", email: "bubblybubble@yahoo.com")
zach = User.find_or_create_by!(first_name: "Zach", last_name: "Smoothguy", email: "spacemarines@hotmail.com")
ellen = User.find_or_create_by!(first_name: "Ellen", last_name: "Frizzle", email: "caligirl@gmail.com")
brian = User.find_or_create_by!(first_name: "Brian", last_name: "Nowak", email: "spanishiscool@gmail.com")

alora_schedule_1 = Schedule.find_or_create_by!(title: "Alora's Thursday Schedule", date: "2023-06-08", user_id: alora.id)
alora_schedule_3 = Schedule.find_or_create_by!(title: "Alora's Saturday Schedule", date: "2023-06-10", user_id: alora.id)

zach_schedule_1 = Schedule.find_or_create_by!(title: "Zach's Thursday Schedule", date: "2023-06-08", user_id: zach.id)
zach_schedule_2 = Schedule.find_or_create_by!(title: "Zach's Saturday Schedule", date: "2023-06-10", user_id: zach.id)

ellen_schedule_1 = Schedule.find_or_create_by!(title: "Ellen's Indie Pop/Rock Schedule", date: "2023-06-10", user_id: ellen.id)

brian_schedule_1 = Schedule.find_or_create_by!(title: "Brian's Must See Artist", date: "2023-06-09", user_id: brian.id)
brian_schedule_2 = Schedule.find_or_create_by!(title: "Brian's Hip Hop", date: "2023-06-08", user_id: brian.id)

show_1 = Show.find_or_create_by!(artist: "Baby Keem", location: "Porto Main Stage", show_time: "2023-06-08 21:00")
show_2 = Show.find_or_create_by!(artist: "Baby Keem", location: "Porto Main Stage", show_time: "2023-06-08 21:00")
show_3 = Show.find_or_create_by!(artist: "Kendrick Lamar", location: "Porto Main Stage", show_time: "2023-06-08 22:30")
show_4 = Show.find_or_create_by!(artist: "The Comet is Coming", location: "Over the Hill", show_time: "2023-06-08 23:00")
show_5 = Show.find_or_create_by!(artist: "Two Shell", location: "Over the Hill", show_time: "2023-06-09 01:00")
show_6 = Show.find_or_create_by!(artist: "Rosalia", location: "Porto Main Stage", show_time: "2023-06-09 00:30")
show_7 = Show.find_or_create_by!(artist: "Fred Again", location: "Over the Hill", show_time: "2023-06-09 23:00")
show_8 = Show.find_or_create_by!(artist: "Alvvays", location: "Super Bock", show_time: "2023-06-09 19:30")
show_9 = Show.find_or_create_by!(artist: "Bad Religion", location: "Super Bock", show_time: "2023-06-09 00:30")
show_10 = Show.find_or_create_by!(artist: "Halsey", location: "Porto Main Stage", show_time: "2023-06-10 22:00")
show_11 = Show.find_or_create_by!(artist: "Blur", location: "Porto Main Stage", show_time: "2023-06-10 00:00")
show_12 = Show.find_or_create_by!(artist: "Built to Spill", location: "Over the Hill", show_time: "2023-06-10 21:00")
show_13 = Show.find_or_create_by!(artist: "New Order", location: "Over the Hill", show_time: "2023-06-10 23:00")