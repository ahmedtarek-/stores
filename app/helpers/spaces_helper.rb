module SpacesHelper
  def self.valid_params
    [
      :title,
      :size,
      :price_per_day,
      :price_per_week,
      :price_per_month
    ]
  end
end