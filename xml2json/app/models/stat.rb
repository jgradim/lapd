class Stat < ActiveRecord::Base

  default_scope :order => 'accesses DESC'

  def self.find_or_create(url)
    stat = Stat.find_by_url(url)
    stat = Stat.create(:url => url) if !stat
    stat
  end

  def self.access(url)
    domain_url = URI.parse(url).host
    stat = find_or_create(domain_url)
    stat.accesses += 1
    stat.save
  end

end

