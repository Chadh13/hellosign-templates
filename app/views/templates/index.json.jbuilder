json.array!(@templates) do |template|
  json.extract! template, :id, :title, :subject, :message, :file
  json.url template_url(template, format: :json)
end
