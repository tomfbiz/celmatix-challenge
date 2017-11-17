# Wroapper record for ActiveRecord
#
# Other records should inherit from this, so that shared behaviors can be but here
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
