class Event < ActiveRecord::Base
  has_many :rsvps
  has_many :presentation_proposals
  has_many :jams
  has_many :users, :through => :rsvps

  validates_presence_of :name, :tag, :held_at, :timezone, :location, :hype, :proposals_close_at, :map_iframe_url, :map_url
  
  # tag needs to start with webjam to be used with the routes setup
  # this is a bit belts-n-braces though:
  validates_format_of :tag, :with => /^webjam\d+$/, :message => "must start with 'webjam'"

  named_scope :published, :conditions => "published_at IS NOT NULL"
  named_scope :upcoming, :conditions => ["held_at >= ?", Time.now]
  named_scope :past, :conditions => ["held_at < ?", Time.now]

  def upcoming?(now=Time.now.utc)
    self.held_at >= now
  end

  def full?
    self.rsvps.count >= (self.rsvp_limit || 0)
  end
  
  def rsvps_left
    (self.rsvp_limit || 0) - self.rsvps.count
  end
  
  def proposals_open?
    Time.now < self.proposals_close_at
  end

  def to_param
    self.tag
  end
  
  def local_held_at
    held_at.in_time_zone(self.timezone)
  end
  
  def number
    tag[/(\d+)$/, 1]
  end
end
