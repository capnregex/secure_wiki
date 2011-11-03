class Page
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Versioning
  include Mongoid::Timestamps
  field :name, :type => String
  field :title, :type => String
  field :content, :type => String, :default => ''
  key :name
  validate :name, presence: true, length: { max: 80, min: 2 }
  def html
#    RDiscount.new(content, :autolink).to_html
    RedCloth.new(content).to_html
  end
  def to_s
    title || name
  end
end
