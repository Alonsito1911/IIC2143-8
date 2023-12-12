class Chat < ApplicationRecord
  serialize :mensajes, JSON
end
