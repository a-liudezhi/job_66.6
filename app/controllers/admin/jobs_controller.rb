class Admin::JobsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
    before_action :require_is_admin
    before_action :validate_search_key, only: [:search]
    layout "admin"

    def index
      @jobs = Job.all.recent.paginate(:page => params[:page], :per_page =>8 )
    end

    def show
      @job = Job.find(params[:id])

    end

    def new
      @job = Job.new
    end

    def create
      @job = Job.new(job_params)
      @job.user = current_user
      if @job.save
        redirect_to admin_jobs_path
      else
        render :new
      end
    end

    def edit
      @job = Job.find(params[:id])
    end

    def update
      @job = Job.find(params[:id])
      if @job.update(job_params)
        redirect_to admin_jobs_path
      else
        render :edit
      end
    end

    def destroy
      @job = Job.find(params[:id])
      @job.destroy
      redirect_to admin_jobs_path
    end

    def publish
      @job = Job.find(params[:id])
      @job.publish!
      redirect_back(fallback_location: root_path)
    end

    def hide
      @job = Job.find(params[:id])
      @job.hide!
      redirect_back(fallback_location: root_path)
    end

    def search
       if @query_string.present?
         search_result = Job.all.ransack(@search_criteria).result(:distinct => true)
         @jobs = search_result.paginate(:page => params[:page], :per_page => 5 )
       end
     end

     def helper
     end

    protected

    def validate_search_key  #去除特殊字符#
      @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
      @search_criteria = search_criteria(@query_string)
    end


    def search_criteria(query_string) #筛选多个栏位#
      { :title_or_description_or_brand_or_location_cont => query_string }
    end

    private

    def job_params
      params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden, :brand, :location)
    end
  end
