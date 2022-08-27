Rails.application.config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid

  g.test_framework :rspec
  g.factory_bot dir: "spec/factories", suffix: "factory"

  g.helper false
  g.assets false
  g.view_specs false
  g.request_specs false
  g.controller_specs true
end
