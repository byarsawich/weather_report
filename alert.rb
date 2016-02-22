class Alert
  def initialize(response)
    @type = response["type"]
    @description = response["description"]
    @date = response["date"]
    @expires = response["expires"]
    @message = response["message"]
  end
end
