class Api < ActiveRecord::Base

  # paperclip
  has_attached_file :image,
                    :url => "/images/apis/:url.:extension",
                    :path => ":rails_root/public/images/apis/:url.:extension",
                    :default_url => '/images/apis/default.png'
  validates_attachment_size :image, :less_than => 1.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

  #
  default_scope :order => 'accesses DESC'

  # callbacks
  after_save :remove_if_no_accesses

  def self.find_or_create(url)
    api = find_by_url(url)
    api = Api.new(:url => url) if not api
    api
  end

  def self.access(url)
    domain_url = URI.parse(url).host
    api = find_or_create(domain_url)
    api.accesses += 1
    api.save
  end

  def self.revert_access(url)
    domain_url = URI.parse(url).host
    api = find_by_url(domain_url)
    api.accesses -= 1
    api.save
  end

  def title_or_url
    title.present? ? title : url
  end

  def remove_if_no_accesses
    self.destroy if self.accesses == 0
  end

end

