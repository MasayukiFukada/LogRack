defmodule LogLacWeb.Resolvers.TemperatureResolvers do
  import LogLac.Member

  def create_temperature(_parent, args, _info) do
    try do
      case LogLac.Measurement.create_temperature(args) do
        {:ok, temperature} ->
          {:ok, %{
            :date => temperature.date,
            :value => temperature.value,
            :device => find_device_by(temperature.device_code),
            :sensor => find_sensor_by(temperature.sensor_code),
            :inserted_at => temperature.inserted_at,
            :updated_at => temperature.updated_at
          }}
        _ ->
          {:error, "気温の登録に失敗しました"}
      end
    rescue
      _ ->
        {:error, "気温の登録に失敗しました"}
    end
  end
end
