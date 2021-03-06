# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean          default(FALSE)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :resumes
  has_many :jobs
  has_many :job_relationships
  has_many :participated_jobs, :through => :job_relationships, :source => :job

  def admin?
   is_admin
  end

  def is_member_of?(job)
    participated_jobs.include?(job)
  end

 def join_col(job)
    participated_jobs << job
  end

 def quit_col(job)
    participated_jobs.delete(job)
  end

end
