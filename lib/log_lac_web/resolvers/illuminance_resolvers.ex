defmodule LogLacWeb.Resolvers.IlluminanceResolvers do
  import LogLac.Member

  def create_illuminance(_parent, args, _info) do
    try do
      case LogLac.Measurement.create_illuminance(args) do
        {:ok, illuminance} ->
          {:ok,
           %{
             :date => illuminance.date,
             :value => illuminance.value,
             :device => find_device_by(illuminance.device_code),
             :sensor => find_sensor_by(illuminance.sensor_code),
             :inserted_at => illuminance.inserted_at,
             :updated_at => illuminance.updated_at
           }}

        _ ->
          {:error, "照度の登録に失敗しました"}
      end
    rescue
      _ ->
        {:error, "照度の登録に失敗しました"}
    end
  end
end
