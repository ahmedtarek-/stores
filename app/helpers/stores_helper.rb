module StoresHelper
  def self.valid_params
    [
      :title,
      :city,
      :street,
      :spaces_count
    ]
  end
end