class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      redirect_to edit_application_path(@application)
    else
      render :new
    end
  end

  def edit
    @application = Application.includes(:competencies, :cover_paras, :values).find(params[:id])
  end

  def show
    string_id = params[:id].downcase.gsub(/[^a-z]/, '')
    @application = Application.includes(:competencies, :cover_paras, :values).find_by_string_id(string_id)
    if @application&.passkey == params[:key]
      nav_tabs = NavTab.all.map { |nav| { id: nav.title.downcase, title: nav.title, iconName: nav.icon_name }}
      jobs = Job.includes(:quotes, :bulletpoints).all.map do |job|
        {
          id: job.string_id,
          institution: job.institution,
          title: job.job_title,
          date: job.date_range,
          imageUrl: job.image_url,
          text: job.text,
          quotes: job.quotes.map { |q| { author: q.author, text: q.text } },
          bulletpoints: job.bulletpoints.map(&:text)
        }
      end
      education = Education.includes(:bulletpoints).all.map do |edu|
        {
          id: edu.string_id,
          institution: edu.institution,
          title: edu.title,
          date: edu.date_range,
          imageUrl: edu.image_url,
          bulletpoints: edu.bulletpoints.map(&:text)
        }
      end
      hobbies = Hobby.includes(:bulletpoints).all.map do |hobby|
        {
          id: hobby.string_id,
          title: hobby.title,
          imageUrl: hobby.image_url,
          bulletpoints: hobby.bulletpoints.map(&:text)
        }
      end
      projects = Project.includes(:bulletpoints).all.map do |project|
        {
          id: project.string_id,
          title: project.title,
          imageUrl: project.image_url,
          url: project.url,
          bulletpoints: project.bulletpoints.map(&:text)
        }
      end
      values = @application.values.map do |val|
        {
          id: val.title.downcase,
          title: val.title,
          text:val.text
        }
      end

      render json: {
        logoUrl: @application.logo_url,
        jobTitle: @application.job_title,
        companyName: @application.company_name,
        navTabs: nav_tabs,
        cover: @application.cover_paras,
        experience: jobs,
        education: education,
        hobbies: hobbies,
        projects: projects,
        values: values
      }
    else
      p '-~--~--~--~----FAIL----~---~---~---~--'
    end
  end

  private

  def application_params
    params.require(:application).permit(:job_title, :company_name, :logo_url, :primary_color, :secondary_color, :background_color, :headers_font, :body_font, :font_link, :string_id, :passkey)
  end
end
