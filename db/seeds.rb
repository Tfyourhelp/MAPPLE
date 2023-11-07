Shop.create!(name: "Mapple",
  email: "mapple@gmail.com",
  password:       "foobar",
  password_confirmation: "foobar",
  phone: "0909090909",
  address: "Số 1 Tô Ký, Phường 12, Quận 12, Thành phố Hồ Chí Minh",
  description: "Mapple là hệ thống bán lẻ máy tính và phụ kiện uy tín tại Việt Nam với chuỗi cửa hàng trải nghiệm độc đáo và đội ngũ tư vấn chuyên sâu, hình thức thanh toán đa dạng và bảo hành uy tín, tin cậy giúp khách hàng tự tin lựa chọn các sản phẩm công nghệ phù hợp nhất." ,
  tax_code: 1234567890)
  
5.times do |n|
  name = Faker::Name.name
  email = "user-#{n+1}@gmail.com"
  password = "password"
  phone = "0" + Faker::Number.number(digits: 9).to_s
  address = Faker::Address.full_address
  User.create!(name: name,
    email: email,
    password:       password,
    password_confirmation: password,
    phone: phone,
    address: address,
    activated: true,
    activated_at: Time.zone.now)
end

laptop = Category.create!(name: "Laptop", shop_id: "1")
path = 'app/assets/images/categories/laptop.jpeg'
laptop.image.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))

keyboard = Category.create!(name: "Keyboard", shop_id: "1")
path = 'app/assets/images/categories/keyboard.jpeg'
keyboard.image.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))

mouse = Category.create!(name: "Mouse", shop_id: "1")
path = 'app/assets/images/categories/mouse.jpeg'
mouse.image.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))

head_phone = Category.create!(name: "Headphone", shop_id: "1")
path = 'app/assets/images/categories/head_phone.jpeg'
head_phone.image.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))

screen = Category.create!(name: "Screen", shop_id: "1")
path = 'app/assets/images/categories/screen.jpeg'
screen.image.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))


#============Product===============
#1
dell_inspiron_145430 = Product.create!(name: "Dell Inspiron 145430", price: 721, description: "Tính tới lúc này, đã có tương đối sản phẩm laptop sử dụng vi xử lý Raptor Lake được giới thiệu tới chúng ta. Tuy nhiên chúng hầu hết lại thiên về gaming, nhu cầu mà không phải ai cũng có ở mức chuyên sâu. Hiện tại thì ThinkPro đã có những chiếc máy văn phòng / đồ họa đầu tiên sử dụng phần cứng thế hệ 13, cụ thể như chiếc Dell Inspiron 14 5430 đang có ở đây. Cùng xem nó có gì đáng để lưu tâm nhé.",
quantity: 100, category_id: 1)
image_paths = [
  'app/assets/images/Laptop/inspiron_14_5430/1.jpeg',
  'app/assets/images/Laptop/inspiron_14_5430/2.jpeg',
  'app/assets/images/Laptop/inspiron_14_5430/3.jpeg',
  'app/assets/images/Laptop/inspiron_14_5430/4.jpeg',
]

image_paths.each do |path|
  dell_inspiron_145430.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end

#2
dell_inspiron_135330 = Product.create!(name: "Dell Inspiron 13 5330", price: 783, description: "Tiếp tục kế thừa phong cách thiết kế trên phiên bản tiền nhiệm, Dell Inspiron 13 5330 mang trong mình ngôn ngữ thiết kế tối giản nhưng sang trọng với xám bạc quen thuộc. Máy được hoàn thiện từ các chất liệu là nhựa - kim loại - magie chắc chắn, các cạnh được “cắt gọt” tinh xảo mang đến cho người dùng một cái nhìn thật sự là chỉn chu.",
quantity: 90, category_id: 1)
image_paths = [
  'app/assets/images/Laptop/inspiron_13_5330/1.jpeg',
  'app/assets/images/Laptop/inspiron_13_5330/2.jpeg',
  'app/assets/images/Laptop/inspiron_13_5330/3.jpeg',
  'app/assets/images/Laptop/inspiron_13_5330/4.jpeg',
]

image_paths.each do |path|
  dell_inspiron_135330.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end


#3
macbook_pro_14_m3 = Product.create!(name: "MacBook Pro 14 M3", price: 1500, description: "MacBook Pro M3 Với M3, M3 Pro, hoặc M3 Max, những con chip tiên tiến nhất dành cho máy tính cá nhân của Apple, MacBook Pro trao cho bạn sức mạnh để thực hiện các dự án phức tạp nhất, Hoạt động bền bỉ cả ngày dài với thời lượng pin lên đến 22 giờ Chú thích¹ Màn hình Liquid Retina XDR tốt nhất từng có ở một chiếc máy tính xách tay, với Extreme Dynamic Range, độ tương phản cực cao và màu chân thật",
quantity: 120, category_id: 1)
image_paths = [
  'app/assets/images/Laptop/macbook_pro_14_m3/1.jpeg',
  'app/assets/images/Laptop/macbook_pro_14_m3/2.jpeg',
  'app/assets/images/Laptop/macbook_pro_14_m3/3.jpeg',
  'app/assets/images/Laptop/macbook_pro_14_m3/4.jpeg',
]

image_paths.each do |path|
  macbook_pro_14_m3.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end

#4
macbook_air_m2 = Product.create!(name: "Macbook Air M2", price: 1195, description: "Macbook Air M2 sở hữu lớp vỏ bằng nhôm cao cấp kết hợp cùng tông màu bóng đêm sang trọng. Thiết kế laptop mỏng nhẹ với độ dày 1.13 cm, trọng lượng 1.24kg thể hiện được ưu điểm vượt trội về tính năng di động cao trong những dòng laptop từ thương hiệu. Từng đường nét trên sản phẩm đều được mài dũa một cách tinh tế. Không chỉ mang nhiệm vụ giải quyết công việc mà còn là món trang sức đắt giá cho người dùng.",
quantity: 100, category_id: 1)

image_paths = [
  'app/assets/images/Laptop/Macbook_air_m2/1.jpeg',
  'app/assets/images/Laptop/Macbook_air_m2/2.jpeg',
  'app/assets/images/Laptop/Macbook_air_m2/3.jpeg',
  'app/assets/images/Laptop/Macbook_air_m2/4.jpeg',
]

image_paths.each do |path|
  macbook_air_m2.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end


#5
macbook_air_m1 = Product.create!(name: "MacBook Air M1", price: 779, description: "Apple cho biết chiếc MacBook Air 2020 mới này sẽ cho hiệu năng mạnh mẽ nhanh hơn tới 3 lần so với chiếc laptop Windows bán chạy nhất trong phân khúc và mạnh nhanh hơn 98% PC được bán ra trong năm ngoái. Bên cạnh đó, Apple cũng tuyên bố con chip M1 mới cho hiệu năng và khả năng tiêu thụ năng lượng hiệu quả hơn bất cứ con chip Intel nào.",
quantity: 83, category_id: 1)

image_paths = [
  'app/assets/images/Laptop/macbook_air_m1/1.jpeg',
  'app/assets/images/Laptop/macbook_air_m1/2.jpeg',
  'app/assets/images/Laptop/macbook_air_m1/3.jpeg',
  'app/assets/images/Laptop/macbook_air_m1/4.jpeg',
]

image_paths.each do |path|
  macbook_air_m1.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end

#6
hp_pavilion_15 = Product.create!(name: "Laptop HP Pavilion 15", price: 958, description: "Laptop HP Pavilion 15 eg3091TU 8C5L2PA là sự kết hợp hoàn hảo giữa hiệu năng và thiết kế. Đây là dòng laptop cho sinh viên và nhân viên văn phòng phổ thông được đánh giá cao về độ bền và khả năng giải quyết công việc hằng ngày. Cùng GEARVN tìm hiểu đánh giá chi tiết về chiếc laptop HP Pavilion 15 ngay nhé!",
quantity: 115, category_id: 1)

image_paths = [
  'app/assets/images/Laptop/hp_pavilon/1.jpeg',
  'app/assets/images/Laptop/hp_pavilon/2.jpeg',
  'app/assets/images/Laptop/hp_pavilon/3.jpeg',
  'app/assets/images/Laptop/hp_pavilon/4.jpeg',
]

image_paths.each do |path|
  hp_pavilion_15.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end


#7
hp_240_g9 = Product.create!(name: "Laptop HP 240 G9", price: 637, description: "Laptop HP 240 G9 6L1Y2PA thiết kế tối giản, trọng lượng nhẹ hỗ trợ khả năng di chuyển dễ dàng mỗi ngày. Hiệu suất hoạt động mạnh mẽ phù hợp với các công việc và học tập hằng ngày. Đây còn là một trong những ứng cử viên sáng giá nếu bạn đang tìm một chiếc laptop ngon - bổ - rẻ.",
quantity: 110, category_id: 1)
image_paths = [
  'app/assets/images/Laptop/Laptop_HP_240_G9/1.jpeg',
  'app/assets/images/Laptop/Laptop_HP_240_G9/2.jpeg',
  'app/assets/images/Laptop/Laptop_HP_240_G9/3.jpeg',
  'app/assets/images/Laptop/Laptop_HP_240_G9/4.jpeg',
]

image_paths.each do |path|
  hp_240_g9.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end


#============Keyboard===============
#8
logitech_g175 = Product.create!(name: "Keyboard Logitech G715", price: 184, description: "G715 TKL phối màu Off White là một trong những dòng bàn phím cơ mới nhất trong series Aurora từ Logitech. Với thiết kế bàn phím TKL nhỏ gọn, cùng các phím bấm media bố trí thông minh giúp bạn thuận lợi trong mọi nhu cầu sử dụng.",
quantity: 90, category_id: 2)
image_paths = [
  'app/assets/images/Ban_phim/logitech_g175/1.jpeg',
  'app/assets/images/Ban_phim/logitech_g175/2.jpeg',
  'app/assets/images/Ban_phim/logitech_g175/3.jpeg',
  'app/assets/images/Ban_phim/logitech_g175/4.jpeg',
]

image_paths.each do |path|
  logitech_g175.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end

#9
era_ek3187w = Product.create!(name: "Keyboard E-DRA EK3187W", price: 44, description: "E-DRA EK3187W là dòng bàn phím cơ giá rẻ được nhiều học sinh - sinh viên dành nhiều sự quan tâm bởi những nâng cấp về hiệu năng hỗ trợ tốt nhất cho mọi nhu cầu sử dụng, công nghệ kết nối ấn tượng, thiết kế nhỏ gọn dễ dàng mang đi bất kỳ đâu.",
quantity: 95, category_id: 2)
image_paths = [
  'app/assets/images/Ban_phim/edraek3187w/1.jpeg',
  'app/assets/images/Ban_phim/edraek3187w/2.jpeg',
  'app/assets/images/Ban_phim/edraek3187w/3.jpeg',
  'app/assets/images/Ban_phim/edraek3187w/4.jpeg',
]

image_paths.each do |path|
  era_ek3187w.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end


#10
magic = Product.create!(name: "Magic Keyboard", price: 195, description: "Magic Keyboard với Touch ID và Numeric Keypad đem lại trải nghiệm gõ phím thoải mái và chính xác ấn tượng. Bàn phím đặc biệt có cách bố trí mở rộng, với các phím điều hướng tài liệu để giúp cuộn nhanh và các phím mũi tên kích thước chuẩn, cực kỳ phù hợp để chơi game. Numeric Keypad cũng rất hữu dụng khi làm bảng tính và dùng ứng dụng tài chính. Bàn phím còn có thể kết nối không dây và sạc lại được, với thời lượng pin dài và bàn phím hoạt động trong một tháng hoặc lâu hơn sau mỗi lần sạc.",
quantity: 100, category_id: 2)

image_paths = [
  'app/assets/images/Ban_phim/magic_keyboard/1.jpeg',
  'app/assets/images/Ban_phim/magic_keyboard/2.jpeg',
  'app/assets/images/Ban_phim/magic_keyboard/3.jpeg',
  'app/assets/images/Ban_phim/magic_keyboard/4.jpeg',
]

image_paths.each do |path|
  magic.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end

#============Mouse===============
#11
logitech_g_pro_x = Product.create!(name: "Mouse Logitech G Pro X", price: 132, description: "Công nghệ phím switch quang học-cơ học kết hợp độc quyền của chúng tôi kết hợp tốc độ và độ tin cậy của phím switch quang học với mức tiêu thụ điện năng thấp và cảm giác nhấp chuột thỏa mãn của micro witch điện truyền thống (hoặc cơ học). Sở hữu hiệu suất mà các chuyên gia cần mà không ảnh hưởng tới thời lượng pin.",
quantity: 40, category_id: 3)
image_paths = [
  'app/assets/images/Chuot/Logitech_GproX/1.jpeg',
  'app/assets/images/Chuot/Logitech_GproX/2.jpeg',
  'app/assets/images/Chuot/Logitech_GproX/3.jpeg',
  'app/assets/images/Chuot/Logitech_GproX/4.jpeg',
]

image_paths.each do |path|
  logitech_g_pro_x.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end


#12
magic_mouse = Product.create!(name: "Magic Mouse", price: 100, description: "Magic Mouse có thể kết nối không dây và sạc lại được, với phần đế được thiết kế tối ưu giúp di chuyển dễ dàng trên mặt bàn. Bề mặt Multi-Touch cho phép bạn thực hiện các thao tác đơn giản như vuốt giữa các trang web và cuộn qua lại giữa các tài liệu.",
quantity: 23, category_id: 3)
image_paths = [
  'app/assets/images/Chuot/Magic_mouse/1.jpeg',
  'app/assets/images/Chuot/Magic_mouse/2.jpeg',
  'app/assets/images/Chuot/Magic_mouse/3.jpeg',
  'app/assets/images/Chuot/Magic_mouse/4.jpeg',
]

image_paths.each do |path|
  magic_mouse.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end


#13
logitech_m650 = Product.create!(name: "Mouse Logitech M650 Graphite", price: 28, description: "Logitech Signature M650 được thiết kế để mang đến cảm giác thoải mái cùng nâng cao hiệu suất và tối ưu năng suất cho bạn dù đang làm việc ở bất kỳ đâu từ văn phòng, quán cà phê hay thậm chí là phòng chờ sân bay. Đây được xem là một trong những sản phẩm chuột không dây giá rẻ dành cho dân văn phòng không nên bỏ qua.",
quantity: 24, category_id: 3)
image_paths = [
  'app/assets/images/Chuot/logitech_M650/1.jpeg',
  'app/assets/images/Chuot/logitech_M650/2.jpeg',
  'app/assets/images/Chuot/logitech_M650/3.jpeg',
  'app/assets/images/Chuot/logitech_M650/4.jpeg',
]

image_paths.each do |path|
  logitech_m650.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end


#14
logitech_m240_silent = Product.create!(name: "Mouse Logitech M240 Silent", price: 16, description: "Chuột Bluetooth Logitech M240 Silent dòng chuột văn phòng sở hữu thiết kế nhỏ gọn, form cầm ôm sát lòng bàn tay tăng thêm phần chắc chắn khi di chuột. Đặc biệt, nhờ vào khả năng tương thích cao nên bạn có thể ghép nối với nhiều thiết bị một cách dễ dàng.",
quantity: 36, category_id: 3)
image_paths = [
  'app/assets/images/Chuot/m240_silent_den/1.jpeg',
  'app/assets/images/Chuot/m240_silent_den/2.jpeg',
  'app/assets/images/Chuot/m240_silent_den/3.jpeg',
  'app/assets/images/Chuot/m240_silent_den/4.jpeg',
]

image_paths.each do |path|
  logitech_m240_silent.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end


#============Headphone===============
#15
logitech_g435 = Product.create!(name: "Headphone Logitech G435 Wireless", price: 62, description: "Nếu bạn đang tìm kiếm một dòng tai nghe máy tính mang phong cách mạnh mẽ và cung cấp đầy đủ tính năng hỗ trợ cho những trận chiến đầy tính rực lửa thì không thể không nhắc đến tai nghe Logitech G435 Lightspeed Wireless Black đến từ nhà Logitech. ",
quantity: 55, category_id: 4)

image_paths = [
  'app/assets/images/tai_nghe/logitech_g435/1.jpeg',
  'app/assets/images/tai_nghe/logitech_g435/2.jpeg',
  'app/assets/images/tai_nghe/logitech_g435/3.jpeg',
  'app/assets/images/tai_nghe/logitech_g435/4.jpeg',
]

image_paths.each do |path|
  logitech_g435.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end

#16
arctis_nova_7p = Product.create!(name: "Headphone Steelseries Arctis Nova 7P", price: 229, description: "Steelseries Arctis Nova 7P Wireless dòng sản phẩm tai nghe Bluetooth sở hữu chất âm sóng động nhờ vào khả năng tái tạo âm thanh đỉnh cao giúp người chơi đắm chìm trong không gian Gaming đa sắc màu. Đặc biệt, nhờ vào thiết kế tai nghe chụp tay cùng phối màu đơn giản nên có thể dễ dàng phối đồ tạo nên phong cách Y2K vô cùng sành điệu.",
quantity: 57, category_id: 4)

image_paths = [
  'app/assets/images/tai_nghe/Steelseries_Arctis_Nova_7P/1.jpeg',
  'app/assets/images/tai_nghe/Steelseries_Arctis_Nova_7P/2.jpeg',
  'app/assets/images/tai_nghe/Steelseries_Arctis_Nova_7P/3.jpeg',
  'app/assets/images/tai_nghe/Steelseries_Arctis_Nova_7P/4.jpeg',
]

image_paths.each do |path|
  arctis_nova_7p.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end

#17
arctis_nova_1 = Product.create!(name: "Headphone SteelSeries Arctis Nova 1", price: 75, description: "SteelSeries Arctis Nova 1 dòng tai nghe máy tính chơi game mang đến cảm giác thoải mái trong cả ngày dài, cung cấp âm thanh chất lượng đa chiều đáp ứng tốt mọi nhu cầu giải trí. Đặc biệt, với việc được tích hợp Mic khử tiếng ồn ClearCast Gen 2 giúp giao tiếp rõ ràng trong những pha giao tranh.",
quantity: 56, category_id: 4)

image_paths = [
  'app/assets/images/tai_nghe/SteelSeries_Arctis_Nova_1/1.jpeg',
  'app/assets/images/tai_nghe/SteelSeries_Arctis_Nova_1/2.jpeg',
  'app/assets/images/tai_nghe/SteelSeries_Arctis_Nova_1/3.jpeg',
  'app/assets/images/tai_nghe/SteelSeries_Arctis_Nova_1/4.jpeg',
]

image_paths.each do |path|
  arctis_nova_1.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end


#18
blackshark_v2_pro = Product.create!(name: "Headphone Razer BlackShark V2 Pro", price: 233, description: "Razer hợp tác với Ubisoft, công bố BlackShark V2 Pro – Six Siege Special Edition, tai nghe máy tính phiên bản limited của tựa game hàng triệu người chơi – Rainbow Six Siege.",
quantity: 17, category_id: 4)

image_paths = [
  'app/assets/images/tai_nghe/Razer_BlackShark_V2_Pro_Rainbow/1.jpeg',
  'app/assets/images/tai_nghe/Razer_BlackShark_V2_Pro_Rainbow/2.jpeg',
  'app/assets/images/tai_nghe/Razer_BlackShark_V2_Pro_Rainbow/3.jpeg',
  'app/assets/images/tai_nghe/Razer_BlackShark_V2_Pro_Rainbow/4.jpeg',
]

image_paths.each do |path|
  blackshark_v2_pro.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end


#19
airpod_max = Product.create!(name: "Airpod max", price: 550, description: "Tai nghe dạng chụp tai được định nghĩa lại hoàn toàn. Từ đệm tai đến gọng đeo, AirPods Max được thiết kế vừa vặn một cách hoàn hảo để tạo ra vòng đệm âm thanh tối ưu, phù hợp với nhiều hình dáng đầu khác nhau giúp bạn đắm chìm hoàn toàn trong mọi âm thanh.",
quantity: 25, category_id: 4)

image_paths = [
  'app/assets/images/tai_nghe/Airpod_max/1.jpeg',
  'app/assets/images/tai_nghe/Airpod_max/2.jpeg',
  'app/assets/images/tai_nghe/Airpod_max/3.jpeg',
  'app/assets/images/tai_nghe/Airpod_max/4.jpeg',
]

image_paths.each do |path|
  airpod_max.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end

#============Screen===============
#20
dell_p2422h = Product.create!(name: "Screen Dell P2422H", price: 200, description: "Màn Hình Dell P2422H có kích thước 24 inch được trang bị tấm nền IPS với độ phủ màu 99% sRGB, màu sắc sống động trên một góc nhìn rộng lên đến 178 độ. Bạn có được màu sắc chính xác để có thể sử dụng ngay mà không cần cân lại màu.",
quantity: 25, category_id: 5)

image_paths = [
  'app/assets/images/man_hinh/dell_p2422/1.jpeg',
  'app/assets/images/man_hinh/dell_p2422/2.jpeg',
  'app/assets/images/man_hinh/dell_p2422/3.jpeg',
  'app/assets/images/man_hinh/dell_p2422/4.jpeg',
]

image_paths.each do |path|
  dell_p2422h.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end



#21
dell_u2422h = Product.create!(name: "Screen Dell Ultrasharp U2422H", price: 236, description: "Dell Ultrasharp U2422H ",
quantity: 34, category_id: 5)

image_paths = [
  'app/assets/images/man_hinh/dell_ultrasharp_u2422/1.jpeg',
  'app/assets/images/man_hinh/dell_ultrasharp_u2422/2.jpeg',
  'app/assets/images/man_hinh/dell_ultrasharp_u2422/3.jpeg',
  'app/assets/images/man_hinh/dell_ultrasharp_u2422/4.jpeg',
]

image_paths.each do |path|
  dell_u2422h.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end


#22
curved_dell_s3422dwg = Product.create!(name: "Curved screen DELL S3422DWG", price: 621, description: "Màn Hình Cong Dell S3422DWG có kích thước 34 inch, độ phân giải WQHD với VESA Display HDR 400, tốc độ làm mới 144Hz mang đến trải nghiệm chơi game thực sự đắm chìm.",
quantity: 15, category_id: 5)

image_paths = [
  'app/assets/images/man_hinh/curve_screen_DELL_S3422DWG/1.jpeg',
  'app/assets/images/man_hinh/curve_screen_DELL_S3422DWG/2.jpeg',
  'app/assets/images/man_hinh/curve_screen_DELL_S3422DWG/3.jpeg',
  'app/assets/images/man_hinh/curve_screen_DELL_S3422DWG/4.jpeg',
]

image_paths.each do |path|
  curved_dell_s3422dwg.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end


#23
studio_display = Product.create!(name: "Studio Display", price: 1541, description: " Studio Display có camera cao cấp với cảm biến 12MP và trường ảnh 122 độ. Và nhờ có Apple silicon, tính năng Trung Tâm Màn Hình lần đầu tiên có mặt trên Mac. Tính năng Trung Tâm Màn Hình giúp bạn luôn ở giữa khung hình khi bạn di chuyển, giúp cuộc gọi video trở nên hấp dẫn hơn. Khi có người khác tham gia hoặc rời khỏi cuộc gọi, chế độ xem sẽ mở rộng hoặc phóng to. Tính năng này cũng hoạt động mượt mà với các ứng dụng họp trực tuyến của bạn.",
  quantity: 15, category_id: 5)
  
image_paths = [
  'app/assets/images/man_hinh/studio_display/1.jpeg',
  'app/assets/images/man_hinh/studio_display/2.jpeg',
  'app/assets/images/man_hinh/studio_display/3.jpeg',
  'app/assets/images/man_hinh/studio_display/4.jpeg',
]

image_paths.each do |path| 
  studio_display.images.attach(io: File.open(Rails.root.join(path)), filename: File.basename(path))
end

Like.create(user_id: 5, product_id: 25)
Like.create(user_id: 5, product_id: 23)
Like.create(user_id: 5, product_id: 21)
Like.create(user_id: 5, product_id: 19)
Like.create(user_id: 5, product_id: 17)
Like.create(user_id: 5, product_id: 15)

Like.create(user_id: 4, product_id: 25)
Like.create(user_id: 4, product_id: 23)
Like.create(user_id: 4, product_id: 21)
Like.create(user_id: 4, product_id: 19)
Like.create(user_id: 4, product_id: 17)
Like.create(user_id: 4, product_id: 15)

Like.create(user_id: 3, product_id: 25)
Like.create(user_id: 3, product_id: 23)
Like.create(user_id: 3, product_id: 21)
Like.create(user_id: 3, product_id: 19)
Like.create(user_id: 3, product_id: 17)
Like.create(user_id: 3, product_id: 15)
