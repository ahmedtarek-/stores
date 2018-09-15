module StoreFactory
  POSSIBLE_TITLES = ["Fender", "Gibson", "Hofner", "Steinway"]

  POSSIBLE_ADDRESSES = [
    { city: "Paris",  street: "Gambetta 12" },
    { city: "Paris",  street: "Crimee 44" },
    { city: "Berlin", street: "Weichselstr 16" },
    { city: "Berlin", street: "Gustav-Mahler-str 31" },
    { city: "Athens", street: "Favierou 41" },
    { city: "Athens", street: "Leonidou 8" },
  ]

  def self.create_stores(count, explicit_params={})
    stores = []
    1.upto(count) do |n|
      stores << Store.create(store_params(explicit_params))
    end
    stores
  end

  def self.store_params(explicit_params)
    address = POSSIBLE_ADDRESSES[rand(0..5)]
    title   = POSSIBLE_TITLES[rand(0..3)]

    params = { title: title,
               city: address[:city],
               street: address[:street]
             }

    params.merge(explicit_params)
  end

end