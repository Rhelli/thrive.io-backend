FactoryBot.define do
  factory :user do
    name { 'MyString' }
    email { 'MyString' }
    password_digest { 'MyString' }
    user_type { 'MyString' }
    images { 'MyText' }
    about { 'MyText' }
    occupation { 'MyString' }
    gender { 'MyString' }
    couple { false }
    pets { false }
    smoking { false }
    min_budget { 1 }
    max_budget { 1 }
    areas_looking { 'MyText' }
    current_status { 'MyString' }
    min_stay { 1 }
    max_stay { 1 }
  end
end
