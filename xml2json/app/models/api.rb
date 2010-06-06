class Api < ActiveRecord::Base

  default_scope :order => 'accesses DESC'

  def self.find_or_create(url)
    api = find_by_url(url)
    api = create(:url => url) if not api
    api
  end

  def self.access(url)
    domain_url = URI.parse(url).host
    api = find_or_create(domain_url)
    api.accesses += 1
    api.save
  end

end

