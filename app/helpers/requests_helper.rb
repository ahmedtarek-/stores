# Handles conversion between url options (eq, like, gt, lt)
# and their adjacent SQL keywords (=, ilike, >, <)
module RequestsHelper
  OPERATORS_MAPPING = {
    "like" => "ilike",
    "eq" => "=",
    "gt" => ">",
    "lt" => "<"
  }

  DEFAULT_SEPARATOR = ":"
  SQL_AND_OPERATOR = "AND"

  def self.conditions_from_params(params)
    values = []
    conditions = []
    params.each do |field, value|
      conditions << sql_mapping_for(field, value.split(DEFAULT_SEPARATOR)[0])
      values << value.split(DEFAULT_SEPARATOR)[1]
    end
    puts "#{[conditions.join(" #{SQL_AND_OPERATOR} "), *values]}"
    [conditions.join(" #{SQL_AND_OPERATOR} "), *values]
  end

  def self.sql_mapping_for(field, operator)
    return unless OPERATORS_MAPPING.keys.include?(operator)
    "#{field} #{OPERATORS_MAPPING[operator]} ?"
  end
end