def add_an_item
  @user = User.create(email: 'test@test.com', password: '123456', password_confirmation: '123456')
  @item = Item.new(size: 'XS', color: 'Orange', category: 'Onesie', description: 'Pokemon onesie', user: @user)
  @item.save!
end

def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@tmail.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end


def another_sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'tk@gma.com')
  fill_in('Password', with: 'tttttt')
  fill_in('Password confirmation', with: 'tttttt')
  click_button('Sign up')
end

def sign_out
  visit('/')
  click_link('Sign out')
end

def upload_bayon_photo
  visit '/items'
  click_link 'Add an item'
  fill_in('Description', with: 'Best beast for best Halloween')
  fill_in('Size', with: 'M')
  fill_in('Color', with: 'Red')
  fill_in('Category', with: 'Costume')
  attach_file("item[image]", Rails.root + "spec/fixtures/ban.jpg")
  click_button('Create Item')
end
