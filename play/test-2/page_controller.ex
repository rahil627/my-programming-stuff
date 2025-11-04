defmodule SupportKickoffWeb.PageController do
  use SupportKickoffWeb, :controller

	#@fly_api_hostname "http://_api.internal:4280" # private
	@fly_api_hostname "https://api.machines.dev" # public # NOTE: use this even for deployment

  def home(conn, _params) do
    # need: id, name, config/image, created_at, region, private_ip,

    # machines is plural... maybe need to use api to get list of machines..

    # # try env vars method first
    # _machine_env_vars = %{ # map
    # id: System.get_env("FLY_MACHINE_ID"),
    # app_name: System.get_env("FLY_APP_NAME"),
    # config: %{image: System.get_env("FLY_IMAGE_REF")}, # map in a map..?
    # # missing created_at
    # region: System.get_env("FLY_REGION"),
    # private_ip: System.get_env("FLY_PRIVATE_IP"),
    # # missing state
    # }

    # get from api :(
    machines = fetch_list_machines()

    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false, machines: machines) # pass to heex template
  end

  defp fetch_list_machines do
   # existing deps: jason, finch

   # build request
   # NOTE: must set these env vars locally for local testing
   api_token = System.get_env("FLY_API_TOKEN") # NOTE: use cli: fly secrets set ...
   app_name = System.get_env("FLY_APP_NAME")
   IO.inspect(app_name, label: APP_NAME)
   #fly_api_url = "#{@fly_api_hostname}/v1/apps/#{app_name}/machines" # NOTE: host-name magically becomes  _api.internal in deployment
     # list machines
   id = System.get_env("FLY_MACHINE_ID")
   IO.inspect(id, label: ID)
   fly_api_url = "#{@fly_api_hostname}/v1/apps/#{app_name}/machines/#{id}" # machines with a s!
     # get machine, NOTE: local machine ID seems to change..

   # this works!: https://api.machines.dev/v1/apps/my-phoenix-app-purple-leaf-2489/machines
		
    headers = [
      {"Authorization", "Bearer #{api_token}"},
      {"Content-Type", "application/json"}
    ]
	body = ""
	# name = SupportKickoff.Finch # reference?

    # fetch request
    # try build/5 first instead
    # req = Finch.build(:get, "https://api.machines.dev/v1/apps/my-phoenix-app-purple-leaf-2489/machines", headers, "") |> Finch.request(SupportKickoff.Finch)
	  # this works in iex!
	
    # (method, url, headers, body, opts)
	req = Finch.build(
	        :get,
	        fly_api_url,
	        headers,
	        body
	      )
    IO.inspect(req, label: REQUEST)
	#|> Finch.request(SupportKickoff.Finch)

    # :request-type (atom), url (string), headers (list of tuples), body (data to send, iodata?)
    #case Finch.request(:get, fly_api_list_machines, headers, body, SupportKickoff.Finch) do
	  # deprecated, i think it uses request/3 instead (name method url)
	case Finch.request(req, SupportKickoff.Finch) do
      {:ok, %Finch.Response{status: 200, body: body}} ->
        {:ok, machines} = Jason.decode(body)
        IO.inspect(machines, label: "MACHINES:")
        machines

	# TODO: ok vs error here..?
      {:ok, %Finch.Response{status: status}} ->
        {:error, "Request failed with status #{status}"}

      {:error, reason} ->
        {:error, reason}
     end
	 
  end

end

