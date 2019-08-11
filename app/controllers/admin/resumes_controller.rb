class Admin::ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  layout 'admin'

  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes.recent.paginate(:page => params[:page], :per_page => 5 )
    set_page_title "应聘 | 工作"  #设定title
 end
end
