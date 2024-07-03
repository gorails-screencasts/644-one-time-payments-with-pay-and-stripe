json.extract! course, :id, :title, :description, :stripe_price, :created_at, :updated_at
json.url course_url(course, format: :json)
