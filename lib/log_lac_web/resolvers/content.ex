defmodule LogLacWeb.Resolvers.Content do
  def list_devices(_parent, _args, _resolution) do
    {:ok, LogLac.Member.list_devices_with_type()}
  end

  def list_temperatures(_parent, _args, _resolution) do
    {:ok, LogLac.Measurement.list_temperatures_filtered()}
  end
end
