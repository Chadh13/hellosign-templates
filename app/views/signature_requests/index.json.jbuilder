json.array!(@signature_requests) do |signature_request|
  json.extract! signature_request, :id, :template_id, :email, :name
  json.url signature_request_url(signature_request, format: :json)
end
