defmodule LogLacWeb.Resolvers.HumidityResolvers do
  import LogLac.Member

  def create_humidity(_parent, args, _info) do
    try do
      case LogLac.Measurement.create_humidity(args) do
        {:ok, humidity} ->
          {:ok,
           %{
             :date => humidity.date,
             :value => humidity.value,
             :device => find_device_by(humidity.device_code),
             :sensor => find_sensor_by(humidity.sensor_code),
             :inserted_at => humidity.inserted_at,
             :updated_at => humidity.updated_at
           }}

        _ ->
          {:error, "湿度の登録に失敗しました"}
      end
    rescue
      _ ->
        {:error, "湿度の登録に失敗しました"}
    end
  end
end
