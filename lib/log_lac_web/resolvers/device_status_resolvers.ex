defmodule LogLacWeb.Resolvers.DeviceStatusResolvers do
  import LogLac.Member

  def create_device_status(_parent, args, _info) do
    case LogLac.Measurement.create_device_status(args) do
      {:ok, device_status} ->
        {:ok, %{
          :cpu_use_rate => device_status.cpu_use_rate,
          :memory_use_rate => device_status.memory_use_rate,
          :storage => device_status.storage,
          :temperature => device_status.temperature,
          :wake_on_at => device_status.wake_on_at,
          :device => find_device_by(device_status.device_code),
        }}
      _error ->
        {:error, "デバイス状態の登録に失敗しました"}
    end
  end
end
