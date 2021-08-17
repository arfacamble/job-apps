require 'json'
seed_data = JSON.parse(File.read(__dir__ + '/application.json'))
p seed_data['logoUrl']

master_app = Application.new(
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

seed_data['navTabs'].each do |nav_data|
  NavTab.create!(
    title: nav_data['title'],
    icon_name: nav_data['iconName']
  )
end

seed_data['cover'].each do |para|

end
