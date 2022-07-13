
namespace :store do
		desc "Creating Users"
		task :create => :environment do
            10.times do 
                puts "User created"
                User.create(:email => Faker::Internet.email, :password => "mani123")
            end
           puts "Done"
		end
end