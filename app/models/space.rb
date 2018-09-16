class Space < ActiveRecord::Base
  belongs_to :store, counter_cache: true

  def calculate_price(start_date, end_date)
    return unless start_date.present? && end_date.present?
    
    start_date = DateTime.strptime(start_date,'%s')
    end_date = DateTime.strptime(end_date,'%s')

    diff_in_days = (end_date - start_date).to_i
    
    months = diff_in_days / 30
    weeks = (diff_in_days - (months*30)) / 7
    days = diff_in_days - (weeks*7) - (months*30)

    self.price_per_month * months +
    self.price_per_week * weeks +
    self.price_per_day * days
  end
end