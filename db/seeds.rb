require 'faker'
nextcar = ["voit1","voit2","voit3","voit4","voit5","voit6","voit7","voit8"]
user = User.new(
  email: "gregory.bail@cogeli.fr",
  nom: Faker::Name.last_name,
  prenom: Faker::Name.first_name,
    adresse: Faker::Address.full_address,
    ville: Faker::Address.city,
    code_postal: Faker::Address.zip_code,
    photo_de_profil: Faker::Avatar.image

  )
  user.password = '123456'
  user.password_confirmation = '123456'
  user.save!



30.times do
  user = User.new(
    email: Faker::Internet.email,
    encrypted_password: Faker::Internet.password,
    nom: Faker::Name.last_name,
    prenom: Faker::Name.first_name,
    adresse: Faker::Address.full_address,
    ville: Faker::Address.city,
    code_postal: Faker::Address.zip_code,
    photo_de_profil: Faker::Avatar.image

  )
  user.password = '123456'
  user.password_confirmation = '123456'
  user.save!

  3.times do
    voiture = Voiture.new(
      marque: Faker::Vehicle.make,
      modele: Faker::Vehicle.model,
      description: Faker::Vehicle.standard_specs,
      annee: Faker::Vehicle.year,
      prix: Faker::Commerce.price(range: 35..250)

    )
    path_voit = "app/assets/images/#{nextcar.sample}.jpg"
    voiture.user =  user
    voiture.image.attach(
      io: File.open(path_voit),
      filename: '404_image.png',
      content_type: 'image/png'
    )
    voiture.save!
    end
  end
  # Faker::LoremFlickr.image,
  # photo.attach(io: File.open(image_path("ferrari.jpg")), filename: 'ferrari.jpg')
