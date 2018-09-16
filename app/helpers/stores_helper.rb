module StoresHelper
  def self.valid_params
    [
      :title,
      :city,
      :street,
      :spaces_count
    ]
  end

  def self.valid_create_params
  	valid_params -
    [
      :spaces_count
    ]
  end
end