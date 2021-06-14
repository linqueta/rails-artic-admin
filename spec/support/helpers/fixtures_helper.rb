# frozen_string_literal: true

module FixturesHelper
  def params_from_json(path, symbolized = true)
    JSON.parse(file_fixture("#{path}.json").read, symbolize_names: symbolized)
  end
end
