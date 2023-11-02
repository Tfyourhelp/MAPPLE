Shop.create!(name: "Mapple",
  email: "mapple@gmail.com",
  password:       "foobar",
  password_confirmation: "foobar",
  phone: "0909090909",
  address: "Số 1 Tô Ký, Phường 12, Quận 12, Thành phố Hồ Chí Minh",
  description: "Mapple là hệ thống bán lẻ máy tính và phụ kiện uy tín tại
                Việt Nam với chuỗi cửa hàng trải nghiệm độc đáo và đội ngũ tư vấn chuyên 
                sâu, hình thức thanh toán đa dạng và bảo hành uy tín, tin cậy giúp khách 
                hàng tự tin lựa chọn các sản phẩm công nghệ phù hợp nhất." ,
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

Category.create!(name: "Laptop", shop_id: "1")
Category.create!(name: "Keyboard", shop_id: "1")
Category.create!(name: "Mouse", shop_id: "1")
Category.create!(name: "Headphone", shop_id: "1")
Category.create!(name: "Screen", shop_id: "1")


#============Product===============
# #1
# Product.create!(name: "Dell Inspiron 145430", price: 721, description: "Tính tới lúc này, đã có tương đối sản phẩm laptop sử dụng vi xử lý Raptor Lake được giới thiệu tới chúng ta. Tuy nhiên chúng hầu hết lại thiên về gaming, nhu cầu mà không phải ai cũng có ở mức chuyên sâu. Hiện tại thì ThinkPro đã có những chiếc máy văn phòng / đồ họa đầu tiên sử dụng phần cứng thế hệ 13, cụ thể như chiếc Dell Inspiron 14 5430 đang có ở đây. Cùng xem nó có gì đáng để lưu tâm nhé.",
# quantity: 100, shop_id: 1)
# #2
# Product.create!(name: "Dell Inspiron 13 5330", price: 783, description: "Tiếp tục kế thừa phong cách thiết kế trên phiên bản tiền nhiệm, Dell Inspiron 13 5330 mang trong mình ngôn ngữ thiết kế tối giản nhưng sang trọng với xám bạc quen thuộc. Máy được hoàn thiện từ các chất liệu là nhựa - kim loại - magie chắc chắn, các cạnh được “cắt gọt” tinh xảo mang đến cho người dùng một cái nhìn thật sự là chỉn chu.",
# quantity: 90, shop_id: 1)
# #3
# Product.create!(name: "MacBook Pro 13 M2", price: 1500, description: "MacBook Pro M2 là một trong những dòng sản phẩm mới nhất được Apple cố bố trong thời gian gần đây. Phiên bản được nâng cấp về thiết kế cũng như chip xử lý M2 giúp người dùng có thể cảm nhận thấy hiệu năng hoạt động xử lý công việc vượt trội, mức tiêu thụ điện thấp,...",
# quantity: 120, shop_id: 1)
# #4
# Product.create!(name: "Macbook Air M2", price: 1195, description: "Macbook Air M2 sở hữu lớp vỏ bằng nhôm cao cấp kết hợp cùng tông màu bóng đêm sang trọng. Thiết kế laptop mỏng nhẹ với độ dày 1.13 cm, trọng lượng 1.24kg thể hiện được ưu điểm vượt trội về tính năng di động cao trong những dòng laptop từ thương hiệu. Từng đường nét trên sản phẩm đều được mài dũa một cách tinh tế. Không chỉ mang nhiệm vụ giải quyết công việc mà còn là món trang sức đắt giá cho người dùng.",
# quantity: 100, shop_id: 1)
# #5
# Product.create!(name: "MacBook Air M1", price: 779, description: "Apple cho biết chiếc MacBook Air 2020 mới này sẽ cho hiệu năng mạnh mẽ nhanh hơn tới 3 lần so với chiếc laptop Windows bán chạy nhất trong phân khúc và mạnh nhanh hơn 98% PC được bán ra trong năm ngoái. Bên cạnh đó, Apple cũng tuyên bố con chip M1 mới cho hiệu năng và khả năng tiêu thụ năng lượng hiệu quả hơn bất cứ con chip Intel nào.",
# quantity: 83, shop_id: 1)
# #6
# Product.create!(name: "Laptop HP Pavilion 15", price: 958, description: "Laptop HP Pavilion 15 eg3091TU 8C5L2PA là sự kết hợp hoàn hảo giữa hiệu năng và thiết kế. Đây là dòng laptop cho sinh viên và nhân viên văn phòng phổ thông được đánh giá cao về độ bền và khả năng giải quyết công việc hằng ngày. Cùng GEARVN tìm hiểu đánh giá chi tiết về chiếc laptop HP Pavilion 15 ngay nhé!",
# quantity: 115, shop_id: 1)
# #7
# Product.create!(name: "Laptop HP 240 G9", price: 637, description: "Laptop HP 240 G9 6L1Y2PA thiết kế tối giản, trọng lượng nhẹ hỗ trợ khả năng di chuyển dễ dàng mỗi ngày. Hiệu suất hoạt động mạnh mẽ phù hợp với các công việc và học tập hằng ngày. Đây còn là một trong những ứng cử viên sáng giá nếu bạn đang tìm một chiếc laptop ngon - bổ - rẻ.",
# quantity: 110, shop_id: 1)

# #8
# Product.create!(name: "Keyboard Logitech G715", price: 184, description: "G715 TKL phối màu Off White là một trong những dòng bàn phím cơ mới nhất trong series Aurora từ Logitech. Với thiết kế bàn phím TKL nhỏ gọn, cùng các phím bấm media bố trí thông minh giúp bạn thuận lợi trong mọi nhu cầu sử dụng.",
# quantity: 90, shop_id: 1)
# #9
# Product.create!(name: "Keyboard E-DRA EK3187W", price: 44, description: "E-DRA EK3187W là dòng bàn phím cơ giá rẻ được nhiều học sinh - sinh viên dành nhiều sự quan tâm bởi những nâng cấp về hiệu năng hỗ trợ tốt nhất cho mọi nhu cầu sử dụng, công nghệ kết nối ấn tượng, thiết kế nhỏ gọn dễ dàng mang đi bất kỳ đâu.",
# quantity: 95, shop_id: 1)
# #10
# Product.create!(name: "Keyboard Keychron K2 Pro QMK/VIA", price: 88, description: "Keychron K2 Pro có thể được xem là một sản phẩm điển hình của Keychron: Đầy đủ về trải nghiệm, hoàn thiện chỉn chu và cực kỳ tiện dụng với khả năng kết nối cũng như tương thích ưu việt với mọi loại hệ điều hành. Đây sẽ là giải pháp tuyệt vời với người dùng có nhu cầu làm việc đa nhiệm, cần một sản phẩm với tính tiện dụng cao và có thể tùy biến đa dạng - nay đã gần như vô tận với phần mềm QMK/VIA.",
# quantity: 91, shop_id: 1)
# #11
# Product.create!(name: "Keyboard Keychron K4 Pro QMK/VIA", price: 104, description: "Keychron K4 Pro có thể được xem là một sản phẩm điển hình của Keychron: Đầy đủ về trải nghiệm, hoàn thiện chỉn chu và cực kỳ tiện dụng với khả năng kết nối cũng như tương thích ưu việt với mọi loại hệ điều hành. Được mở rộng hơn nữa với hệ thống numpad, đây sẽ là giải pháp tuyệt vời với người dùng có nhu cầu làm việc đa nhiệm, cần một sản phẩm với tính tiện dụng cao và có thể tùy biến đa dạng - nay đã gần như vô tận với phần mềm QMK/VIA."
# , quantity: 100, shop_id: 1)
# #12
# Product.create!(name: "Keyboard Logitech G715 TKL Off White", price: 184, description: "G715 TKL phối màu Off White là một trong những dòng bàn phím cơ mới nhất trong series Aurora từ Logitech. Với thiết kế bàn phím TKL nhỏ gọn, cùng các phím bấm media bố trí thông minh giúp bạn thuận lợi trong mọi nhu cầu sử dụng.",
# quantity: 84, shop_id: 1)
# #13
# Product.create!(name: "Keyboard Logitech G512 GX RGB Tactile", price: 84, description: "Bàn phím cơ giá rẻ Logitech G512 GX được thiết kế hướng đến hiệu suất và tích hợp công nghệ chơi game mạnh mẽ. Từ các chi tiết tinh tế nhất như kết cấu mờ phủ vân tay và dây cáp có độ bền cao, tới chi tiết phức tạp nhất, mỗi khía cạnh được thiết kế chính xác bởi công nghệ dẫn đầu ngành của Logitech G cùng chất lượng vào kiểu dáng được chế tạo độc đáo.",
# quantity: 105, shop_id: 1)
  

# #14
# Product.create!(name: "Mouse Logitech G Pro X", price: 132, description: "Công nghệ phím switch quang học-cơ học kết hợp độc quyền của chúng tôi kết hợp tốc độ và độ tin cậy của phím switch quang học với mức tiêu thụ điện năng thấp và cảm giác nhấp chuột thỏa mãn của micro witch điện truyền thống (hoặc cơ học). Sở hữu hiệu suất mà các chuyên gia cần mà không ảnh hưởng tới thời lượng pin.",
# quantity: 40, shop_id: 1)
# #15
# Product.create!(name: "Mouse Chuột Logitech G102 LightSync Black", price: 17.5, description: "Dù có mức giá rất bình dân nhưng chuột Logitech G102 Lightsync RGB lại được trang bị led  RGB 16,8 triệu màu .Chọn một màu hay trộn 3 màu, hiệu ứng có sẵn hay tạo hiệu ứng của riêng bạn . Sự lựa chọn là của bạn ! Bạn còn có thể đồng bộ chuột với thiết bị LIGHTSYNC của Logitech G khác giúp góc máy trở nên đồng bộ và độc đáo hơn.",
# quantity: 23, shop_id: 1)
# #16
# Product.create!(name: "Mouse Logitech G Logitech G502 Hero", price: 40, description: "Ngoài hiệu suất cốt lõi và các tính năng cá nhân, nhiều chi tiết được thiết kế và chế tạo với sự tận tâm. Logitech G502 Hero là một trong những dòng chuột gaming giá rẻ so với các sản phẩm ở cùng phân khúc với dây bện với nút buộc dây có khóa nhám, phần cầm nắm bên có viền cao su, cửa từ vào khoang để khối nặng và nhiều hơn nữa.",
# quantity: 22, shop_id: 1)
# #17
# Product.create!(name: "Mouse Logitech M650 Signature Graphite", price: 28, description: "Logitech Signature M650 được thiết kế để mang đến cảm giác thoải mái cùng nâng cao hiệu suất và tối ưu năng suất cho bạn dù đang làm việc ở bất kỳ đâu từ văn phòng, quán cà phê hay thậm chí là phòng chờ sân bay. Đây được xem là một trong những sản phẩm chuột không dây giá rẻ dành cho dân văn phòng không nên bỏ qua.",
# quantity: 24, shop_id: 1)
# #18
# Product.create!(name: "Mouse Logitech M240 Silent", price: 16, description: "Chuột Bluetooth Logitech M240 Silent dòng chuột văn phòng sở hữu thiết kế nhỏ gọn, form cầm ôm sát lòng bàn tay tăng thêm phần chắc chắn khi di chuột. Đặc biệt, nhờ vào khả năng tương thích cao nên bạn có thể ghép nối với nhiều thiết bị một cách dễ dàng.",
# quantity: 36, shop_id: 1)

# #19
# Product.create!(name: "Headphone Logitech G435 Lightspeed Wireless", price: 62, description: "Nếu bạn đang tìm kiếm một dòng tai nghe máy tính mang phong cách mạnh mẽ và cung cấp đầy đủ tính năng hỗ trợ cho những trận chiến đầy tính rực lửa thì không thể không nhắc đến tai nghe Logitech G435 Lightspeed Wireless Black đến từ nhà Logitech. ",
# quantity: 55, shop_id: 1)
# #20
# Product.create!(name: "Headphone Steelseries Arctis Nova 7P", price: 229, description: "Steelseries Arctis Nova 7P Wireless dòng sản phẩm tai nghe Bluetooth sở hữu chất âm sóng động nhờ vào khả năng tái tạo âm thanh đỉnh cao giúp người chơi đắm chìm trong không gian Gaming đa sắc màu. Đặc biệt, nhờ vào thiết kế tai nghe chụp tay cùng phối màu đơn giản nên có thể dễ dàng phối đồ tạo nên phong cách Y2K vô cùng sành điệu.",
# quantity: 57, shop_id: 1)
# #21
# Product.create!(name: "Headphone SteelSeries Arctis Nova 1", price: 75, description: "SteelSeries Arctis Nova 1 dòng tai nghe máy tính chơi game mang đến cảm giác thoải mái trong cả ngày dài, cung cấp âm thanh chất lượng đa chiều đáp ứng tốt mọi nhu cầu giải trí. Đặc biệt, với việc được tích hợp Mic khử tiếng ồn ClearCast Gen 2 giúp giao tiếp rõ ràng trong những pha giao tranh.",
# quantity: 56, shop_id: 1)
# #22
# Product.create!(name: "Headphone Razer BlackShark V2 X", price: 54, description: "Razer BlackShark V2 X là dòng tai nghe máy tính được thiết kế hoàn toàn mới đã được cấp bằng sáng chế. Có thể tùy chỉnh từng trình điều khiển cho phép sao chép riêng lẻ các tần số âm thanh cao, trung và thấp để mang lại âm thanh phong phú hơn, âm thanh sáng hơn và âm trầm mạnh mẽ.",
# quantity: 10, shop_id: 1)
# #23
# Product.create!(name: "Headphone Razer BlackShark V2 Pro - Rainbow", price: 233, description: "Razer hợp tác với Ubisoft, công bố BlackShark V2 Pro – Six Siege Special Edition, tai nghe máy tính phiên bản limited của tựa game hàng triệu người chơi – Rainbow Six Siege.",
# quantity: 17, shop_id: 1)
# #24
# Product.create!(name: "Headphone Razer Kaira Pro HALO Infinite Edition", price: 200, description: "Kaira Pro là mẫu tai nghe máy tính được thiết kế đặc biệt để tương thích với nhiều nền tảng và thiết bị. Bạn có thể kết nối với Xbox Wireless và Bluetooth 5.0. Ngoài ra, nó còn cho phép bạn kết nối với Xbox Series X. Nó có thể vận hành trên hệ điều hành Windows 10 mà không cần dùng dongle. Điện thoại hoặc máy tính bảng Android có thể kết nối với thiết bị Bluetooth 5.0. ",
# quantity: 25, shop_id: 1)


# #25
# Product.create!(name: "Screen Dell P2422H", price: 200, description: "Màn Hình Dell P2422H có kích thước 24 inch được trang bị tấm nền IPS với độ phủ màu 99% sRGB, màu sắc sống động trên một góc nhìn rộng lên đến 178 độ. Bạn có được màu sắc chính xác để có thể sử dụng ngay mà không cần cân lại màu.",
# quantity: 25, shop_id: 1)
# #26
# Product.create!(name: "Screen Dell Ultrasharp U2422H", price: 236, description: "Dell Ultrasharp U2422H ",
# quantity: 34, shop_id: 1)
# #27
# Product.create!(name: "Curved screen DELL S3422DWG", price: 621, description: "Màn Hình Cong Dell S3422DWG có kích thước 34 inch, độ phân giải WQHD với VESA Display HDR 400, tốc độ làm mới 144Hz mang đến trải nghiệm chơi game thực sự đắm chìm.",
# quantity: 15, shop_id: 1)
#28
# Product.create!(name: "Headphone Razer Kaira Pro HALO Infinite Edition", price: 200, description: "Kaira Pro là mẫu tai nghe máy tính được thiết kế đặc biệt để tương thích với nhiều nền tảng và thiết bị. Bạn có thể kết nối với Xbox Wireless và Bluetooth 5.0. Ngoài ra, nó còn cho phép bạn kết nối với Xbox Series X. Nó có thể vận hành trên hệ điều hành Windows 10 mà không cần dùng dongle. Điện thoại hoặc máy tính bảng Android có thể kết nối với thiết bị Bluetooth 5.0. ",
# quantity: 40, shop_id: 1)
# #29
# Product.create!(name: "Headphone Razer Kaira Pro HALO Infinite Edition", price: 200, description: "Kaira Pro là mẫu tai nghe máy tính được thiết kế đặc biệt để tương thích với nhiều nền tảng và thiết bị. Bạn có thể kết nối với Xbox Wireless và Bluetooth 5.0. Ngoài ra, nó còn cho phép bạn kết nối với Xbox Series X. Nó có thể vận hành trên hệ điều hành Windows 10 mà không cần dùng dongle. Điện thoại hoặc máy tính bảng Android có thể kết nối với thiết bị Bluetooth 5.0. ",
# quantity: 18, shop_id: 1)
# #30
# Product.create!(name: "Headphone Razer Kaira Pro HALO Infinite Edition", price: 200, description: "Kaira Pro là mẫu tai nghe máy tính được thiết kế đặc biệt để tương thích với nhiều nền tảng và thiết bị. Bạn có thể kết nối với Xbox Wireless và Bluetooth 5.0. Ngoài ra, nó còn cho phép bạn kết nối với Xbox Series X. Nó có thể vận hành trên hệ điều hành Windows 10 mà không cần dùng dongle. Điện thoại hoặc máy tính bảng Android có thể kết nối với thiết bị Bluetooth 5.0. ",
# quantity: 60, shop_id: 1)





#============Product===============
#1
Product.create!(name: "Dell Inspiron 145430", price: 721, description: "Tính tới lúc này, đã có tương đối sản phẩm laptop sử dụng vi xử lý Raptor Lake được giới thiệu tới chúng ta. Tuy nhiên chúng hầu hết lại thiên về gaming, nhu cầu mà không phải ai cũng có ở mức chuyên sâu. Hiện tại thì ThinkPro đã có những chiếc máy văn phòng / đồ họa đầu tiên sử dụng phần cứng thế hệ 13, cụ thể như chiếc Dell Inspiron 14 5430 đang có ở đây. Cùng xem nó có gì đáng để lưu tâm nhé.",
quantity: 100, shop_id: 1)
#2
Product.create!(name: "Dell Inspiron 13 5330", price: 783, description: "Tiếp tục kế thừa phong cách thiết kế trên phiên bản tiền nhiệm, Dell Inspiron 13 5330 mang trong mình ngôn ngữ thiết kế tối giản nhưng sang trọng với xám bạc quen thuộc. Máy được hoàn thiện từ các chất liệu là nhựa - kim loại - magie chắc chắn, các cạnh được “cắt gọt” tinh xảo mang đến cho người dùng một cái nhìn thật sự là chỉn chu.",
quantity: 90, shop_id: 1)
#3
Product.create!(name: "MacBook Pro 13 M2", price: 1500, description: "MacBook Pro M2 là một trong những dòng sản phẩm mới nhất được Apple cố bố trong thời gian gần đây. Phiên bản được nâng cấp về thiết kế cũng như chip xử lý M2 giúp người dùng có thể cảm nhận thấy hiệu năng hoạt động xử lý công việc vượt trội, mức tiêu thụ điện thấp,...",
quantity: 120, shop_id: 1)
#4
Product.create!(name: "Macbook Air M2", price: 1195, description: "Macbook Air M2 sở hữu lớp vỏ bằng nhôm cao cấp kết hợp cùng tông màu bóng đêm sang trọng. Thiết kế laptop mỏng nhẹ với độ dày 1.13 cm, trọng lượng 1.24kg thể hiện được ưu điểm vượt trội về tính năng di động cao trong những dòng laptop từ thương hiệu. Từng đường nét trên sản phẩm đều được mài dũa một cách tinh tế. Không chỉ mang nhiệm vụ giải quyết công việc mà còn là món trang sức đắt giá cho người dùng.",
quantity: 100, shop_id: 1)
#5
Product.create!(name: "MacBook Air M1", price: 779, description: "Apple cho biết chiếc MacBook Air 2020 mới này sẽ cho hiệu năng mạnh mẽ nhanh hơn tới 3 lần so với chiếc laptop Windows bán chạy nhất trong phân khúc và mạnh nhanh hơn 98% PC được bán ra trong năm ngoái. Bên cạnh đó, Apple cũng tuyên bố con chip M1 mới cho hiệu năng và khả năng tiêu thụ năng lượng hiệu quả hơn bất cứ con chip Intel nào.",
quantity: 83, shop_id: 1)
#6
Product.create!(name: "Laptop HP Pavilion 15", price: 958, description: "Laptop HP Pavilion 15 eg3091TU 8C5L2PA là sự kết hợp hoàn hảo giữa hiệu năng và thiết kế. Đây là dòng laptop cho sinh viên và nhân viên văn phòng phổ thông được đánh giá cao về độ bền và khả năng giải quyết công việc hằng ngày. Cùng GEARVN tìm hiểu đánh giá chi tiết về chiếc laptop HP Pavilion 15 ngay nhé!",
quantity: 115, shop_id: 1)
#7
Product.create!(name: "Laptop HP 240 G9", price: 637, description: "Laptop HP 240 G9 6L1Y2PA thiết kế tối giản, trọng lượng nhẹ hỗ trợ khả năng di chuyển dễ dàng mỗi ngày. Hiệu suất hoạt động mạnh mẽ phù hợp với các công việc và học tập hằng ngày. Đây còn là một trong những ứng cử viên sáng giá nếu bạn đang tìm một chiếc laptop ngon - bổ - rẻ.",
quantity: 110, shop_id: 1)
#8
Product.create!(name: "Keyboard Logitech G715", price: 184, description: "G715 TKL phối màu Off White là một trong những dòng bàn phím cơ mới nhất trong series Aurora từ Logitech. Với thiết kế bàn phím TKL nhỏ gọn, cùng các phím bấm media bố trí thông minh giúp bạn thuận lợi trong mọi nhu cầu sử dụng.",
quantity: 90, shop_id: 1)
#9
Product.create!(name: "Keyboard E-DRA EK3187W", price: 44, description: "E-DRA EK3187W là dòng bàn phím cơ giá rẻ được nhiều học sinh - sinh viên dành nhiều sự quan tâm bởi những nâng cấp về hiệu năng hỗ trợ tốt nhất cho mọi nhu cầu sử dụng, công nghệ kết nối ấn tượng, thiết kế nhỏ gọn dễ dàng mang đi bất kỳ đâu.",
quantity: 95, shop_id: 1)
#10
Product.create!(name: "Mouse Logitech G Pro X", price: 132, description: "Công nghệ phím switch quang học-cơ học kết hợp độc quyền của chúng tôi kết hợp tốc độ và độ tin cậy của phím switch quang học với mức tiêu thụ điện năng thấp và cảm giác nhấp chuột thỏa mãn của micro witch điện truyền thống (hoặc cơ học). Sở hữu hiệu suất mà các chuyên gia cần mà không ảnh hưởng tới thời lượng pin.",
quantity: 91, shop_id: 1)