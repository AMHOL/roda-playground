require File.expand_path('../boot', __FILE__)

Bundler.require

# TODO: ROM multi-env
Core.load.finalize

require File.expand_path('../application', __FILE__)
require File.expand_path('../api/application', __FILE__)
require File.expand_path('../api/routes', __FILE__)
require File.expand_path('../web/application', __FILE__)
require File.expand_path('../web/routes', __FILE__)
require File.expand_path('../routes', __FILE__)
