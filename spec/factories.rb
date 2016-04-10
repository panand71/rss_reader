FactoryGirl.define do  

  factory :entry do
    title 'New Headline'
    url 'http://headlines.com'
    created_at "2016-04-09 17:45:32"  
  end

  factory :favorite do
    
  end

  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'

  end
end