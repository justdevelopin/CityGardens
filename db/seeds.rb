# Clear existing users to avoid duplication
require "open-uri"

User.destroy_all
Event.destroy_all
Garden.destroy_all

# User 1
User.create(
  email: 'user1@example.com',
  password: 'password1',
  password_confirmation: 'password1',
  first_name: 'John',
  last_name: 'Doe',
  bio: 'Enthusiast of urban gardening and sustainable living.',
  is_admin: true
)

# User 2
User.create(
  email: 'user2@example.com',
  password: 'password2',
  password_confirmation: 'password2',
  first_name: 'Jane',
  last_name: 'Smith',
  bio: 'Passionate about community building and green spaces.',
  is_admin: true
)

# User 3
User.create(
  email: 'user3@example.com',
  password: 'password3',
  password_confirmation: 'password3',
  first_name: 'Emily',
  last_name: 'Taylor',
  bio: 'Dedicated to nurturing community connections through gardening.',
  is_admin: true
)

# User 4
User.create(
  email: 'user4@example.com',
  password: 'password4',
  password_confirmation: 'password4',
  first_name: 'Michael',
  last_name: 'Brown',
  bio: 'Exploring the intersection of art and nature in urban spaces.',
  is_admin: true
)

# User 5
User.create(
  email: 'user5@example.com',
  password: 'password5',
  password_confirmation: 'password5',
  first_name: 'Sarah',
  last_name: 'Wilson',
  bio: 'Advocate for sustainable living and organic food cultures.',
  is_admin: true
)

# User 6
User.create(
  email: 'user6@example.com',
  password: 'password6',
  password_confirmation: 'password6',
  first_name: 'Daniel',
  last_name: 'Moore',
  bio: 'Gardening enthusiast and community volunteer coordinator.',
  is_admin: true
)

# User 7
User.create(
  email: 'user7@example.com',
  password: 'password7',
  password_confirmation: 'password7',
  first_name: 'Jessica',
  last_name: 'Davis',
  bio: 'Focused on creating educational programs in urban gardening.',
  is_admin: true
)

# User 8
User.create(
  email: 'user8@example.com',
  password: 'password8',
  password_confirmation: 'password8',
  first_name: 'Chris',
  last_name: 'Miller',
  bio: 'Passionate about permaculture and biodiversity in city landscapes.',
  is_admin: true
)

# User 9
User.create(
  email: 'user9@example.com',
  password: 'password9',
  password_confirmation: 'password9',
  first_name: 'Laura',
  last_name: 'Martinez',
  bio: 'Engaged in community outreach and green urban development.',
  is_admin: true
)

# User 10
User.create(
  email: 'user10@example.com',
  password: 'password10',
  password_confirmation: 'password10',
  first_name: 'Alex',
  last_name: 'Johnson',
  bio: 'Lover of nature and advocate for environmental education.',
  is_admin: true
)

# Garden 1
Garden.create(
  user_id: User.find_by(email: 'user1@example.com').id,
  name: 'Urban Oasis',
  description: 'A small yet vibrant garden in the heart of the city, perfect for urban dwellers.',
  location: 'Parc de la Ciutadella, Barcelona'

)

# Garden 2
Garden.create(
  user_id: User.find_by(email: 'user2@example.com').id,
  name: 'Riverside Retreat',
  description: 'A peaceful garden by the river, offering a serene escape from the urban hustle.',
  location: 'Parc de Joan Miró, Barcelona'
)

# Garden 3
Garden.create(
  user_id: User.find_by(email: 'user3@example.com').id,
  name: 'Parc de la Ciutadella Haven',
  description: 'A lush green space within the famous Parc de la Ciutadella, promoting urban biodiversity.',
  location: 'Parc de la Ciutadella, Barcelona'

)

# Garden 4
Garden.create(
  user_id: User.find_by(email: 'user4@example.com').id,
  name: 'Montjuïc Hillside Garden',
  description: 'Located on the scenic Montjuïc hill, this garden offers breathtaking views of the city and sea.',
  location: 'Montjuïc, Barcelona'
)

# Garden 5
Garden.create(
  user_id: User.find_by(email: 'user5@example.com').id,
  name: 'Park Güell Community Garden',
  description: 'A vibrant garden nestled in the artistic surroundings of Park Güell, inspired by Gaudí’s work.',
  location: 'Park Güell, Barcelona'
)

# Garden 6
Garden.create(
  user_id: User.find_by(email: 'user6@example.com').id,
  name: 'Labyrinth Park of Horta',
  description: 'A historic garden featuring a labyrinth, perfect for those who enjoy a touch of mystery.',
  location: 'Labyrinth Park of Horta, Barcelona'
)

# Garden 7
Garden.create(
  user_id: User.find_by(email: 'user7@example.com').id,
  name: 'Jardins de Joan Brossa',
  description: 'A tranquil garden offering a variety of flora and artistic sculptures.',
  location: 'Jardins de Joan Brossa, Barcelona'
)

# Garden 8
Garden.create(
  user_id: User.find_by(email: 'user8@example.com').id,
  name: 'Jardins del Palau Robert',
  description: 'A small but elegant garden known for its peaceful ambiance and beautiful plant arrangements.',
  location: 'Jardins del Palau Robert, Barcelona'
)

# Garden 9
Garden.create(
  user_id: User.find_by(email: 'user9@example.com').id,
  name: 'Jardins de Mossèn Costa i Llobera',
  description: 'Specializing in cacti and succulents, this garden offers a unique botanical experience.',
  location: 'Jardins de Mossèn Costa i Llobera, Barcelona'
)

# Garden 10
Garden.create(
  user_id: User.find_by(email: 'user10@example.com').id,
  name: 'Green Haven',
  description: 'A large community-focused garden promoting environmental education and sustainability.',
  location: 'Parc de Montjuïc, Barcelona',
)

# Gardening Workshops at Garden 1 (Urban Oasis)
Event.create!(
  garden_id: Garden.find_by(name: 'Urban Oasis').id,
  name: 'Gardening Workshops',
  description: 'Educational sessions on organic gardening, composting, or sustainable practices.',
  date: Date.new(2024, 3, 15),
  max_attendees: 15
)

# Plant Swap Meet at Garden 2 (Riverside Retreat)
Event.create(
  garden_id: Garden.find_by(name: 'Riverside Retreat').id,
  name: 'Plant Swap Meet',
  description: 'A gathering where community members can exchange plants or seeds.',
  date: Date.new(2024, 4, 10),
  max_attendees: 15
)

# Garden Yoga Classes at Garden 3 (Parc de la Ciutadella Haven)
Event.create(
  garden_id: Garden.find_by(name: 'Parc de la Ciutadella Haven').id,
  name: 'Garden Yoga Classes',
  description: 'Offering yoga sessions amidst the tranquility of the garden.',
  date: Date.new(2024, 5, 20),
  max_attendees: 15
)

# Schools Gardening Day at Garden 4 (Montjuïc Hillside Garden)
Event.create(
  garden_id: Garden.find_by(name: 'Montjuïc Hillside Garden').id,
  name: 'Schools Gardening Day',
  description: 'Activities and learning experiences designed for young gardeners.',
  date: Date.new(2024, 6, 17),
  max_attendees: 15
)

# Garden Art Day at Garden 5 (Park Güell Community Garden)
Event.create(
  garden_id: Garden.find_by(name: 'Park Güell Community Garden').id,
  name: 'Garden Art Day',
  description: 'Encouraging artistic expression in the garden, such as painting or sculpture.',
  date: Date.new(2024, 7, 22),
  max_attendees: 15
)

# Community Dinners at Garden 6 (Labyrinth Park of Horta)
Event.create(
  garden_id: Garden.find_by(name: 'Labyrinth Park of Horta').id,
  name: 'Community Dinners',
  description: 'Everyone brings a dish to share, preferably made with garden produce.',
  date: Date.new(2024, 8, 12),
  max_attendees: 15
)

# Garden Book Club at Garden 7 (Jardins de Joan Brossa)
Event.create(
  garden_id: Garden.find_by(name: 'Jardins de Joan Brossa').id,
  name: 'Garden Book Club',
  description: 'Discussing books related to gardening, nature, or sustainability.',
  date: Date.new(2024, 9, 15),
  max_attendees: 15
)

# Garden Volunteer Days at Garden 8 (Jardins del Palau Robert)
Event.create(
  garden_id: Garden.find_by(name: 'Jardins del Palau Robert').id,
  name: 'Garden Volunteer Days',
  description: 'Organizing community work days for garden maintenance and improvement.',
  date: Date.new(2024, 10, 18),
  max_attendees: 15
)

# Garden-Themed Movie Nights at Garden 9 (Jardins de Mossèn Costa i Llobera)
Event.create(
  garden_id: Garden.find_by(name: 'Jardins de Mossèn Costa i Llobera').id,
  name: 'Garden-Themed Movie Nights',
  description: 'Outdoor screenings of films related to gardening or nature.',
  date: Date.new(2024, 11, 5),
  max_attendees: 15
)

# Nature Photography Workshop at Garden 10 (Green Haven)
Event.create(
  garden_id: Garden.find_by(name: 'Green Haven').id,
  name: 'Nature Photography Workshop',
  description: 'A workshop focusing on capturing the beauty of the garden and its natural surroundings through photography.',
  date: Date.new(2024, 12, 10),
  max_attendees: 15
)
