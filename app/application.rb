class Application
 
  @@cart = []
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
  if @@cart == []
      resp.write "Your cart is empty"
  end
    if req.path.match(/cart/)
      @@cart.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/add/)
      @@cart << @@items
    
    else
      resp.write "Error"
    end
 
    resp.finish
  end
end