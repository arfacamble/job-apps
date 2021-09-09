class ApplicationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

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
    @all_cover_paras = CoverPara.all.order(id: :asc)
    @other_values = Value.all.reject { |val| @application.values.include? val }
    @value = Value.new
    @other_competencies = Competency.all.reject { |comp| @application.competencies.include? comp }
    @competency = Competency.new
  end

  def update
    @application = Application.find(params[:id])
    @application.update(application_params)
    redirect_to edit_application_path(@application)
  end

  def show
    string_id = params[:id].downcase.gsub(/[^a-z]/, '')
    @application = Application.includes(:competencies, :cover_paras, :values).find_by_string_id(string_id)
    if @application&.passkey == params[:key]
      # nav_tabs = NavTab.all.map { |nav| { id: nav.title.downcase, title: nav.title, iconName: nav.icon_name }}
      jobs = format_jobs
      education = format_education
      hobbies = format_hobbies
      projects = format_projects
      values = format_values(@application)
      competencies = format_competencies(@application)

      render json: {
        logoUrl: @application.logo_url,
        jobTitle: @application.job_title,
        companyName: @application.company_name,
        primaryColor: @application.primary_color,
        secondaryColor: @application.secondary_color,
        backgroundColor: @application.background_color,
        headersFont: @application.headers_font,
        bodyFont: @application.body_font,
        fontLink: @application.font_link,
        # navTabs: nav_tabs,
        cover: @application.cover_paras,
        experience: jobs,
        education: education,
        hobbies: hobbies,
        projects: projects,
        values: values,
        competencies: competencies
      }
    else
      render json: {
        failure: 'company name and passkey fail to match'
      }
    end
  end

  private

  def application_params
    params.require(:application).permit(:job_title, :company_name, :logo_url, :primary_color, :secondary_color, :background_color, :headers_font, :body_font, :font_link, :string_id, :passkey)
  end

  def format_jobs
    Job.includes(:quotes, :bulletpoints).all.order(start_date: :desc).map do |job|
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
  end

  def format_education
    Education.includes(:bulletpoints).all.map do |edu|
      {
        id: edu.string_id,
        institution: edu.institution,
        title: edu.title,
        date: edu.date_range,
        imageUrl: edu.image_url,
        bulletpoints: edu.bulletpoints.map(&:text)
      }
    end
  end

  def format_hobbies
    Hobby.includes(:bulletpoints).all.map do |hobby|
      {
        id: hobby.string_id,
        title: hobby.title,
        imageUrl: hobby.image_url,
        bulletpoints: hobby.bulletpoints.map(&:text)
      }
    end
  end

  def format_projects
    Project.includes(:bulletpoints).all.map do |project|
      {
        id: project.string_id,
        title: project.title,
        imageUrl: project.image_url,
        url: project.url,
        bulletpoints: project.bulletpoints.map(&:text)
      }
    end
  end

  def format_values(application)
    application.values.map do |val|
      {
        id: val.title.downcase,
        title: val.title,
        text:val.text
      }
    end
  end

  def format_competencies(application)
    application.competencies.map do |comp|
      {
        id: comp.title.downcase,
        title: comp.title,
        imgUrl: comp.image_url,
        text: comp.text
      }
    end
  end
end
