json.array!(@tasks) do |task|
  json.extract! work, :id, :name, :due, :level, :user_id
  json.url task_url(work, format: :json)
end
