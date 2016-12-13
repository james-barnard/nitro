module RouteManHelper
  def route_options(routes)
    routes.collect  {|r| [r.name,r.id.to_s]}
  end
end
