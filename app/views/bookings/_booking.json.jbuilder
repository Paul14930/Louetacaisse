json.extract! booking, :id, :date_debut, :date_fin, :user_id, :voiture_id, :valide, :created_at, :updated_at
json.url booking_url(booking, format: :json)
