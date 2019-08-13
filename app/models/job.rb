# == Schema Information
#
# Table name: jobs
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  wage_upper_bound :integer
#  wage_lower_bound :integer
#  contact_email    :string
#  is_hidden        :boolean          default(TRUE)
#

class Job < ApplicationRecord
  validates :title, presence: { message: "请填写职位名称" }
  validates :brand, presence: { message: "请填写职位品牌/公司" }
  validates :description, presence: { message: "请填写职位描述/要求" }
  validates :wage_lower_bound, presence: { message: "请填写最低薪水" }
  validates :wage_upper_bound, presence: { message: "请填写最高薪水" }
  validates :wage_lower_bound, numericality: { greater_than: 0, message: "最低薪水必须大于零" }
  validates :wage_upper_bound, numericality: { greater_than: :wage_lower_bound, message: "薪水上限不能低于薪水下限" }
  validates :location, presence: { message: "请填写工作地点" }
  scope :published, -> { where(is_hidden: false) }
  scope :recent, -> { order('created_at DESC') }
  has_many :resumes, dependent: :destroy
  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
