json.extract! ticket, :id, :name, :status, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
