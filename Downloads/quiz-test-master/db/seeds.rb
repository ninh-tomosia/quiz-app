# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.delete_all
Category.create(:name_category => 'Toán lớp 1',
    :image_url => 'toan_lop_1.jpg'
    )

Category.create(:name_category => 'Tiếng anh thiếu nhi',
    :image_url => 'anh_van_thieu_nhi.jpg'
   )
Category.create(:name_category => 'Tiếng Việt lơp 1',
    :image_url => 'tieng_viet_lop_1.jpg'
   )

