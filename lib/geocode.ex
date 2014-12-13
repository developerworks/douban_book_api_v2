defmodule DoubanBookApiV2.GetBook do
    @doc """
    把地址转换成坐标
    ```
    Geocode.start()
    coords = Geocode.fetch("Fairfax, Vermont")
    IO.puts coords[:lat]
    IO.puts coords[:lng]
    ```
    """
    def fetch(address) do
        url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(address)}&sensor=false"
        IO.puts "Get location from #{url}"
        result = HTTPotion.get(url, [], [:timeout, 15000])
        {[{"results", [json | _]}, _]} = :jiffy.decode result.body
        IO.puts json
        [
            lat: :ej.get({"geometry", "location", "lat"}, json),
            lng: :ej.get({"geometry", "location", "lng"}, json)
        ]
    end
end