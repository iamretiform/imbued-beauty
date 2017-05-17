json.extract! portfolio, :id, :title, :about, :photos, :created_at, :updated_at
json.url portfolio_url(portfolio, format: :json)
