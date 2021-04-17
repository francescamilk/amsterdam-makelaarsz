admin_account = Account.new(first_name: 'Francesca', last_name: 'Santoriello', email: 'milk@makelaars.com', company: 'Milk Makelaars', telephone: '+39 3394840509', admin: true )

seed_property = Property.new(account_id: 1, name: 'Wooden Beauty', address: 'Oudezijds Voorburgwal 126', price: 2000000, rooms: 7, bedrooms: 4, bathrooms: 3)