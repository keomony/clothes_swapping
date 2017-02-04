include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :item do
    size "XS"
    color "Orange"
    category "Onesie"
    description "Pokemon onesie"
    image { fixture_file_upload(Rails.root.join('spec', 'files', 'images', 'pokemon_onesie.jpg'), 'image/png') }
    user_id "1"
  end
end
