class TpcrProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :tpcr
  belongs_to :quality_control
  belongs_to :part 

  has_many :fpcr_products
  has_many :pcr_gel_lanes, :as => :pcr_product
  has_many :ligations, :as => :pcr_product
  
  scope :pendings, where(:status_id => Status.find_by_process_and_name(Tpcr.to_s,:pending))

  scope :reaction_pass, where(:quality_control_id => QualityControl.find_by_process_and_name(Tpcr.to_s,:pass))
  scope :reaction_pass_for, lambda{|user| joins(:tpcr).where(:quality_control_id => QualityControl.find_by_process_and_name(Tpcr.to_s,:pass), :tpcrs => {:user_id => user.id})}

  scope :reaction_fail, where(:quality_control_id => QualityControl.find_by_process_and_name(Tpcr.to_s,:fail))
  scope :reaction_fail_for, lambda{|user| joins(:tpcr).where(:quality_control_id => QualityControl.find_by_process_and_name(Tpcr.to_s,:fail), :tpcrs => {:user_id => user.id})}

  attr_accessible :part, :quality_control, :tpcr, :user, :pcr_gel_lanes, :pcr_product
  attr_accessible :quality_control_id, :tpcr_id, :user_id

  def to_s
    "#{part.name} (#{id})"
  end
  
  def to_label
    "#{part.name} (tPCR, #{id})"
  end

end
