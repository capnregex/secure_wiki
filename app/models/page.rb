class Page
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Versioning
  include Mongoid::Timestamps
  field :name, :type => String
  field :content, :type => String, :default => ''
  field :html, :type => String, :default => ''
  key :name
  validate :name, presence: true, length: { max: 80, min: 2 }
  before_save :encode_html

  def encode_html
    self.html = RDiscount.new(content, :autolink, :smart).to_html
#    RedCloth.new(content).to_html
  end
  def to_s
    (name || '').to_s.titleize
  end
end
