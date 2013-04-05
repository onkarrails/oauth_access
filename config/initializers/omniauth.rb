# Rails.application.config.middleware.use OmniAuth::Builder do
#   # The following is for facebook
#   provider :facebook, '490055731044002', 'c840411ac83699c63d564b4ee3623d55', {:scope =>'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
 
#   # If you want to also configure for additional login services, they would be configured here.
# end

# Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, "JcsAKwwgwDV3ypuB6YJHpA", "1AGZclDG6fxE9PpcPhPT2FvKrynqRSo3CFxDT5PEIO0"
# end
# Rails.application.config.middleware.use OmniAuth::Builder do
# 	provider :twitter, ENV['04DtIIGx5qfIVsTLhK2TvA'], ENV['ms88G8KW2KBGs9blljFDgjPOMhz1Bb6Ij0F6RpQdkg']
# end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :developer unless Rails.env.production?
#   provider :twitter, ENV['04DtIIGx5qfIVsTLhK2TvA'], ENV['ms88G8KW2KBGs9blljFDgjPOMhz1Bb6Ij0F6RpQdkg']
# end