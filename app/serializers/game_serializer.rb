class GameSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :message
end
