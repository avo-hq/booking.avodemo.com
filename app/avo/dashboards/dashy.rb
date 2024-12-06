class Avo::Dashboards::Dashy < Avo::Dashboards::BaseDashboard
  self.id = "dashy"
  self.name = "Dashy"
  self.description = "Main metrics dashboard"
  # self.grid_cols = 3
  # self.visible = -> do
  #   true
  # end

  def cards
    card Avo::Cards::BookingsCount
    card Avo::Cards::BookedHours
    card Avo::Cards::BookingsOverTime
  end
end
