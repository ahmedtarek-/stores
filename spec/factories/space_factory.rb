module SpaceFactory
  POSSIBLE_TITLES = ["space_1", "space_2", "space_3", "space_4"]

  def self.create_spaces(count, explicit_params={})
    spaces = []
    1.upto(count) do |n|
      spaces << Space.create(space_params(explicit_params))
    end
    spaces
  end

  def self.space_params(explicit_params)
    title = POSSIBLE_TITLES[rand(0..3)]
    size  = rand(100..1000)
    price_per_day = rand(100..1000)
    price_per_week = rand(700..7000)
    price_per_month = rand(3000..30000)

    params = { title: title,
               size: size,
               price_per_day: price_per_day,
               price_per_week: price_per_week,
               price_per_month: price_per_month
             }

    params.merge(explicit_params)
  end

end