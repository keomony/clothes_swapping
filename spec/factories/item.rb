include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :item do
    size "XS"
    color "Orange"
    category "Onesie"
    description "Pokemon onsie"
    image { fixture_file_upload(Rails.root.join('spec', 'files', 'images', 'pokemon_onesie.jpg'), 'image/png') }
  end
end
