# Clear existing users to avoid duplication
require "open-uri"

User.destroy_all
Event.destroy_all
Garden.destroy_all


garden_image_urls = [
  "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701653370/CityGarden/pbjdxgmh3rykyfpnken3.jpg",
  "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701653369/CityGarden/s103tg7whgledhifhvyq.jpg",
  "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701653368/CityGarden/tzu9ozcrnnwrjblabekm.jpg",
  "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701653318/CityGarden/lupy6uqwxkm1dayl0xod.jpg",
  "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701653235/CityGarden/iz09jb6c4x4hq5u71vqt.jpg",
  "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701653208/CityGarden/kpyuybol4tsocgvrxgol.jpg",
  "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701653167/CityGarden/kqfiqx5gwptgia0kn0vc.jpg",
  "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701653142/CityGarden/yfdtefjdwbkg4fh4knzp.jpg",
  "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701653106/CityGarden/m4rdxikvr8v9hfmht8bl.jpg",
  "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701653369/CityGarden/jc1uz5vl3v7jk3omdwgs.jpg"
]

garden_names = ['Urban Oasis', 'Riverside Retreat', 'Parc de la Ciutadella Haven', 'Montjuïc Hillside Garden', 'Park Güell Community Garden', 'Labyrinth Park of Horta', 'Jardins de Joan Brossa', 'Jardins del Palau Robert', 'Jardins de Mossèn Costa i Llobera', 'Green Haven']

garden_locations = [
  'Parc de la Ciutadella, Barcelona',
  'Parc de Joan Miró, Barcelona',
  'Parc de la Ciutadella, Barcelona',
  'Montjuïc, Barcelona',
  'Park Güell, Barcelona',
  'Labyrinth Park of Horta, Barcelona',
  'Jardins de Joan Brossa, Barcelona',
  'Jardins del Palau Robert, Barcelona',
  'Jardins de Mossèn Costa i Llobera, Barcelona',
  'Parc de Montjuïc, Barcelona'
]


garden_descriptions = [
  "A small yet vibrant garden nestled in the heart of the city, Urban Oasis beckons urban dwellers seeking a green refuge. Its diverse array of flora, thoughtfully curated in compact spaces, offers not just a visual treat but a serene escape from the bustling city life. Whether you seek solace or a place to reconnect with nature, this intimate garden provides a peaceful sanctuary amid the urban landscape.",
  "Serenity finds its home at Riverside Retreat, a peaceful garden harmoniously situated by the flowing river. Beyond its picturesque setting, this garden offers a serene escape from the constant urban hustle. With nature as its canvas, it invites visitors to unwind, listen to the soothing sounds of the river, and indulge in tranquil moments amidst a verdant sanctuary.",
  "Nestled within the famous Parc de la Ciutadella, this lush green space stands as an urban oasis promoting biodiversity. Its vibrant ecosystem, adorned with diverse flora, not only captivates the eye but also serves as a haven for urban wildlife. Embracing nature in the heart of the city, this garden offers a scenic respite where visitors can explore and celebrate the richness of urban biodiversity.",
  "Perched atop the scenic Montjuïc hill, this garden mesmerizes visitors with breathtaking views spanning the city and sea. Beyond its stunning vistas, the garden's curated landscape provides a sensory delight, marrying panoramic views with meticulously nurtured flora. It's an elevated retreat where visitors can immerse themselves in beauty while relishing panoramic perspectives of the surrounding landscapes.",
  "Vibrancy meets artistic inspiration in this garden nestled amid the creative ambiance of Park Güell. Inspired by Gaudí's visionary work, the garden's vibrant landscapes and architectural elements evoke a sense of wonder. Visitors can explore and experience the artistic essence that intertwines seamlessly with nature, offering an enriching journey through art and greenery.",
  "Steeped in history and mystery, this historic garden captivates explorers with its labyrinthine pathways. Beyond its enigmatic allure, the garden boasts a diverse collection of flora and provides an intriguing space for those seeking both natural beauty and a touch of mystique. It's an inviting landscape where visitors can lose themselves in the charm of horticultural puzzles and serene surroundings.",
  "Tranquility takes form in this tranquil garden adorned with an array of flora and artistic sculptures. Beyond its botanical charm, the garden serves as a canvas for artistic expression, blending nature and art seamlessly. Its serene ambiance invites visitors to appreciate both the beauty of meticulously arranged plant life and the creative allure of sculptural artworks.",
  "Elegance defines this small yet sophisticated garden, renowned for its peaceful ambiance and meticulously arranged plant compositions. Amidst its intimate setting, visitors can immerse themselves in the beauty of carefully curated plant arrangements and find moments of quiet contemplation. It's a serene retreat where simplicity meets sophistication in a harmonious blend of nature and design.",
  "Specializing in cacti and succulents, this garden offers a unique botanical experience amidst a diverse collection of arid plants. Its focus on desert flora provides an educational yet visually striking landscape, inviting visitors to explore the captivating world of succulents and cacti. It's a specialized haven celebrating the resilience and beauty of drought-resistant plant species.",
  "As a large community-focused garden, Green Haven stands as an educational hub promoting environmental awareness and sustainability. Its expansive landscape serves as an interactive platform for visitors of all ages to engage with nature, fostering a deeper understanding of ecological balance. Beyond its lush greenery, this garden encourages community involvement and environmental stewardship, embodying the spirit of a sustainable, nature-centric haven."
]

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

10.times do |i|
  user = User.find_by(email: "user#{i + 1}@example.com")
  garden = Garden.create(
    user: user,
    name: garden_names[i],
    description: garden_descriptions[i],
    location: garden_locations[i]
  )


  image_url = garden_image_urls[i]
  downloaded_image = URI.open(image_url)
  garden.photos.attach(io: downloaded_image, filename: "garden_#{i + 1}.jpg")
end


# Gardening Workshops at Garden 1 (Urban Oasis)
Event.create!(
  garden_id: Garden.find_by(name: 'Urban Oasis').id,
  name: 'Gardening Workshops',
  description: "Join us at Urban Oasis for a series of engaging and informative gardening workshops. Delve into the world of organic gardening, composting techniques, and sustainable practices. These educational sessions aim to empower attendees with the knowledge and skills needed to cultivate their own thriving green spaces while fostering a deeper connection to nature. Whether you are a seasoned gardener or just starting, these workshops provide a nurturing environment to learn and grow together.",
  date: DateTime.new(2024, 3, 15, 14),
  max_attendees: 15,
  image_url: "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701688773/Best-Plants-for-a-Community-Garden-in-Moderate-Climates-1024x682_fdhw3q.jpg"
)

# Plant Swap Meet at Garden 2 (Riverside Retreat)
Event.create(
  garden_id: Garden.find_by(name: 'Riverside Retreat').id,
  name: 'Plant Swap Meet',
  description: "At Riverside Retreat, immerse yourself in a green haven and be part of our Plant Swap Meet. It's a delightful gathering where gardening enthusiasts and community members come together to exchange plants, seeds, and gardening stories. This event celebrates the diversity of flora while fostering connections within the community. Bring your favorite plants to swap, discover new species, and expand your garden while mingling with fellow plant lovers against the serene backdrop of Riverside Retreat.",
  date: DateTime.new(2024, 4, 10, 10, 30),
  max_attendees: 15,
  image_url: "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701658322/development/szg2y82cxmm184nu2jtw5lvksc0q.jpg"
)

# Garden Yoga Classes at Garden 3 (Parc de la Ciutadella Haven)
Event.create(
  garden_id: Garden.find_by(name: 'Parc de la Ciutadella Haven').id,
  name: 'Garden Yoga Classes',
  description: "Experience tranquility and wellness in the heart of nature at Parc de la Ciutadella Haven's Garden Yoga Classes. These sessions offer a unique opportunity to rejuvenate mind, body, and spirit amidst the lush greenery of the garden. Led by experienced instructors, these yoga classes encourage a harmonious blend of movement and relaxation, allowing participants to unwind and find inner peace within the serene landscape of the park.",
  date: DateTime.new(2024, 5, 20, 9),
  max_attendees: 15,
  image_url: "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701436356/CityGarden/imagen15_djqasy.jpg"
)

# Schools Gardening Day at Garden 4 (Montjuïc Hillside Garden)
Event.create(
  garden_id: Garden.find_by(name: 'Montjuïc Hillside Garden').id,
  name: 'Schools Gardening Day',
  description: "Montjuïc Hillside Garden invites young gardeners and schools for an immersive and educational experience on Schools Gardening Day. This event is designed to spark curiosity and foster a love for nature among children through hands-on gardening activities. With interactive workshops and engaging tasks, kids will learn about plant life, sustainability, and the joy of nurturing green spaces, fostering a sense of responsibility towards the environment in a playful and inspiring setting.",
  date: DateTime.new(2024, 6, 17, 12),
  max_attendees: 15,
  image_url: "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701436342/CityGarden/imagen12_iuzjij.jpg"
)

# Garden Art Day at Garden 5 (Park Güell Community Garden)
Event.create(
  garden_id: Garden.find_by(name: 'Park Güell Community Garden').id,
  name: 'Garden Art Day',
  description: "Unleash your creativity amidst the natural beauty of Park Güell Community Garden on Garden Art Day. This event invites artists and enthusiasts to express themselves through various art forms such as painting, sculpture, and more. It's a day dedicated to celebrating art in nature, allowing participants to draw inspiration from the vibrant surroundings and create captivating works of art, fostering a deeper appreciation for the intersection of creativity and the natural world.",
  date: DateTime.new(2024, 7, 22, 17, 30),
  max_attendees: 15,
  image_url: "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701436039/CityGarden/imagen9_b8wiii.jpg",
)

# Community Dinners at Garden 6 (Labyrinth Park of Horta)
Event.create(
  garden_id: Garden.find_by(name: 'Labyrinth Park of Horta').id,
  name: 'Community Dinners',
  description: "Join us for an evening of community and culinary delights at Labyrinth Park of Horta's Community Dinners. Bring a dish made from garden-fresh produce and share in a potluck-style gathering with fellow garden enthusiasts. It's an opportunity to connect, bond, and savor delicious homemade meals while surrounded by the beauty of the garden, fostering a sense of togetherness and appreciation for locally grown, wholesome food.",
  date: DateTime.new(2024, 8, 12, 18),
  max_attendees: 15,
  image_url: "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701435933/CityGarden/imagen5_fzcqoo.jpg",
)

# Garden Book Club at Garden 7 (Jardins de Joan Brossa)
Event.create(
  garden_id: Garden.find_by(name: 'Jardins de Joan Brossa').id,
  name: 'Garden Book Club',
  description: "Indulge in literary discussions amidst the serene ambiance of Jardins de Joan Brossa's Garden Book Club. This gathering invites bookworms and nature enthusiasts to explore literature centered around gardening, nature, and sustainability. Dive into thought-provoking conversations, share insights, and connect with like-minded individuals passionate about both literature and the natural world. It's a delightful opportunity to cultivate knowledge, exchange ideas, and nurture a deeper understanding of our relationship with nature through the power of storytelling.",
  date: DateTime.new(2024, 9, 15, 20),
  max_attendees: 15,
  image_url: "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701435925/CityGarden/imagen4_dckxtm.webp",
)

# Garden Volunteer Days at Garden 8 (Jardins del Palau Robert)
Event.create(
  garden_id: Garden.find_by(name: 'Jardins del Palau Robert').id,
  name: 'Garden Volunteer Days',
  description: "Join hands for a shared cause on Garden Volunteer Days at Jardins del Palau Robert. This event invites the community to come together for a day of collective action aimed at maintaining and enhancing the garden's beauty. From planting new blooms to tidying up pathways, participants contribute to the upkeep and growth of the garden, fostering a sense of ownership and pride in this shared green space. It's a chance to make a tangible difference while forging lasting connections within the community.",
  date: DateTime.new(2024, 10, 18, 10),
  max_attendees: 15,
  image_url: "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701435915/CityGarden/imagen3_mgx0aj.webp",
)

# Garden-Themed Movie Nights at Garden 9 (Jardins de Mossèn Costa i Llobera)
Event.create(
  garden_id: Garden.find_by(name: 'Jardins de Mossèn Costa i Llobera').id,
  name: 'Garden-Themed Movie Nights',
  description: "Experience cinematic enchantment under the stars at Jardins de Mossèn Costa i Llobera's Garden-Themed Movie Nights. Set against the backdrop of lush greenery, these outdoor screenings feature films that celebrate gardening, nature, and environmental consciousness. Gather with friends and fellow film enthusiasts to enjoy thought-provoking and visually captivating movies that inspire a deeper appreciation for the natural world. It's an evening of entertainment and enlightenment, fostering a sense of wonder and reflection amidst the garden's serene setting.",
  date: DateTime.new(2024, 11, 5, 19),
  max_attendees: 15,
  image_url: "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701435758/CityGarden/imagen2_vful5m.avif",
)

# Nature Photography Workshop at Garden 10 (Green Haven)
Event.create(
  garden_id: Garden.find_by(name: 'Green Haven').id,
  name: 'Nature Photography Workshop',
  description: "Capture the breathtaking beauty of nature at Green Haven's Nature Photography Workshop. This immersive workshop is tailored for photography enthusiasts seeking to hone their skills in capturing the garden's mesmerizing landscapes and natural wonders through the lens. Led by seasoned photographers, participants will explore techniques, compositions, and the art of storytelling through nature photography. It's an opportunity to connect with nature on a deeper level while refining photography skills in a picturesque setting.",
  date: DateTime.new(2024, 12, 10, 13),
  max_attendees: 15,
  image_url: "https://res.cloudinary.com/drlqgbpvb/image/upload/v1701435688/CityGarden/imagen1_dgufml.jpg",
)
