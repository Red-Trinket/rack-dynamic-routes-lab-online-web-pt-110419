class Application 
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new 
    
    if req.path.match(/items/)
      item_name = req.path.split("/items").last 
      item = Item.find{|i| i.name == item_name}
      
      resp.write item.price 
    else 
      resp.write "404"
    end 
  end 
end 