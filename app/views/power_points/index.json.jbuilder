json.array!(@power_points) do |power_point|
  json.extract! power_point, :id, :name, :output_path, :file_name, :file_size, :file_type
  json.url power_point_url(power_point, format: :json)
end
