class Api < ActiveRecord::Base

  has_attached_file :image,
                    :url => "/images/apis/:url.:extension",
                    :path => ":rails_root/public/images/apis/:url.:extension",
                    :default_url => '/images/apis/default.png'

  validates_attachment_size :image, :less_than => 1.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

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

  def title_or_url
    title.present? ? title : url
  end

end

