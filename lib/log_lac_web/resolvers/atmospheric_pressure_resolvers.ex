defmodule LogLacWeb.Resolvers.AtmosphericPressureResolvers do
  import LogLac.Member

  def create_atmospheric_pressure(_parent, args, _info) do
    try do
      case LogLac.Measurement.create_atmospheric_pressure(args) do
        {:ok, atmospheric_pressure} ->
          {:ok,
           %{
             :date => atmospheric_pressure.date,
             :value => atmospheric_pressure.value,
             :device => find_device_by(atmospheric_pressure.device_code),
             :sensor => find_sensor_by(atmospheric_pressure.sensor_code),
             :inserted_at => atmospheric_pressure.inserted_at,
             :updated_at => atmospheric_pressure.updated_at
           }}

        _ ->
          {:error, "気圧の登録に失敗しました"}
      end
    rescue
      _ ->
        {:error, "気圧の登録に失敗しました"}
    end
  end
end
