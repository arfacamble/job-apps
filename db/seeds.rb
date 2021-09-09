require 'json'
seed_data = JSON.parse(File.read(__dir__ + '/application.json'))

Application.destroy_all
Value.destroy_all
Competency.destroy_all
CoverPara.destroy_all

master_app = Application.new(
  string_id: 'google',
  passkey: 'google',
  job_title: 'Full Stack Developer',
  company_name: 'Google',
  logo_url: seed_data['logoUrl'],
  primary_color: '#9AC4F8',
  secondary_color: '#343330',
  background_color: '#F0FFF1',
  headers_font: 'Poppins',
  body_font: 'Montserrat',
  font_link: 'https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap'
)
master_app.save!

seed_data['values'].values.each do |value|
  new_value = Value.new(
    title: value['title'],
    text: value['text']
  )
  new_value.save!
  AppValue.create!(application: master_app, value: new_value)
end

seed_data['competencies'].values.each do |comp|
  new_comp = Competency.new(
    title: comp['title'],
    text: comp['text'],
    image_url: comp['imgUrl']
  )
  new_comp.save!
  AppCompetency.create!(application: master_app, competency: new_comp)
end

order = 1
seed_data['cover'].each do |para|
  new_para = CoverPara.new(text: para)
  new_para.save!
  AppCoverPara.create!(application: master_app, cover_para: new_para, order: order)
  order += 1
end

NavTab.destroy_all

seed_data['navTabs'].values.each do |nav_data|
  NavTab.create!(
    title: nav_data['title'],
    icon_name: nav_data['iconName']
  )
end

Job.destroy_all

seed_data['experience'].values.each do |job|
  new_job = Job.new(
    string_id: job['id'],
    institution: job['institution'],
    job_title: job['title'],
    date_range: job['date'],
    image_url: job['imageUrl'],
    text: job['text'],
    start_date: Date.new(job['date'].split[1].to_i)
  )
  new_job.save!
  job['quotes'].each do |quote|
    Quote.create!(author: quote['author'], text: quote['text'], job: new_job)
  end
  job['bulletpoints'].each do |point|
    Bulletpoint.create!(text: point, card: new_job)
  end
end

Education.destroy_all

seed_data['education'].values.each do |edu|
  new_edu = Education.new(
    string_id: edu['id'],
    institution: edu['institution'],
    title: edu['title'],
    date_range: edu['date'],
    image_url: edu['imageUrl'],
    start_date: Date.new(edu['date'].split[1].to_i)
  )
  new_edu.save!
  edu['bulletpoints'].each do |point|
    Bulletpoint.create!(text: point, card: new_edu)
  end
end

Hobby.destroy_all

seed_data['hobbies'].values.each do |hobby|
  new_hobby = Hobby.new(
    string_id: hobby['id'],
    title: hobby['title'],
    image_url: hobby['imageUrl']
  )
  new_hobby.save!
  hobby['bulletpoints'].each do |point|
    Bulletpoint.create!(text: point, card: new_hobby)
  end
end

Project.destroy_all

seed_data['projects'].values.each do |project|
  new_project = Project.new(
    string_id: project['id'],
    url: project['url'],
    title: project['title'],
    image_url: project['imageUrl']
  )
  new_project.save!
  project['bulletpoints'].each do |point|
    Bulletpoint.create!(text: point, card: new_project)
  end
end

application_backend = Project.new(
  string_id: 'applicationBackend',
  url: 'https://job-application-api.herokuapp.com/',
  title: 'Application Preparation Backend',
  image_url: 'application-backend.png'
)
application_backend.save!
Bulletpoint.create!(
  text: 'interface to streamline preparation of applications',
  card: application_backend
)
Bulletpoint.create!(
  text: 'API endpoint to expose applications to VueJS frontend',
  card: application_backend
)
Bulletpoint.create!(
  text: 'Rails, devise, tailwind, sqlite',
  card: application_backend
)

application_frontend = Project.new(
  string_id: 'applicationFrontend',
  url: '/',
  title: 'SPA Job Application',
  image_url: 'Vue-SPA-applications.png'
)
application_frontend.save!
Bulletpoint.create!(
  text: 'check out the smoothly expanding cards in the experience tab!',
  card: application_frontend
)
Bulletpoint.create!(
  text: 'VueJS frontend that retrieves application data from Rails backend given credentials',
  card: application_frontend
)
Bulletpoint.create!(
  text: 'tailwind variables for colours and fonts set through CSS variables after compilation to allow personalised styling',
  card: application_frontend
)
