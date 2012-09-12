require 'open-uri'

def http_get(url)
  open(url, 'User-Agent' => Conf['user_agent']).read
end
