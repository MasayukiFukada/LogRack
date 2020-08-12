# 生成時の設定記録

## モデルの生成

* 生成した後も色々加工する必要があるので注意
  * null: false の追加
  * 外部キーで PKey 以外に張る場合は references の修正( column, type )

mix phx.gen.html Member DeviceType device_types code:string:unique name:string
mix phx.gen.html Member Device devices code:string:unique name:string remarks:string type_code:references:device_types
mix phx.gen.html Member Sensor sensors code:string:unique name:string remarks:string
mix phx.gen.html Measurement DeviceStatus device_statuses wake_on_at:utc_datetime cpu_use_rate:integer memory_use_rate:integer temperature:float storage:integer device_code:references:devices
mix phx.gen.html Measurement Temperature temperatures date:utc_datetime device_code:references:devices sensor_code:references:sensors value:float
mix phx.gen.html Measurement Humidity humidities date:utc_datetime device_code:references:devices sensor_code:references:sensors value:integer
mix phx.gen.html Measurement Illuminance illuminances date:utc_datetime device_code:references:devices sensor_code:references:sensors value:integer
mix phx.gen.html Measurement AtmosphericPressure atmospheric_pressures date:utc_datetime device_code:references:devices sensor_code:references:sensors value:integer
mix phx.gen.html Measurement InertialMeasurementUnit inertial_measurement_units date:utc_datetime device_code:references:devices sensor_code:references:sensors pich:integer roll:integer yaw:integer x_acceleration:integer y_acceleration:integer z_acceleration:integer
mix phx.gen.html Measurement Sound sounds date:utc_datetime device_code:references:devices sensor_code:references:sensors value:integer
