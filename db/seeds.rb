# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.find_by(email: "a.liudezhi@gmail.com").nil?
a = User.new
a.email = "a.liudezhi@gmail.com"           # 可以改成自己的 email
a.password = "12345678"                # 最少要六码
a.password_confirmation = "12345678"   # 最少要六码
a.is_admin = true
a.save
puts "Admin 已经建立好了，帐号为#{a.email}, 密码为#{a.password}"
else
puts "Admin 已经建立过了，帐号: a.liudezhi@gmail.com , 密码: 12345678 , 脚本跳过该步骤。"
end

if User.find_by(email: "think72013@aliyun.com").nil?
u = User.new
u.email = "think72013@aliyun.com"           # 可以改成自己的 email
u.password = "12345678"                # 最少要六码
u.password_confirmation = "12345678"   # 最少要六码
u.is_admin = false
u.save
puts "User 已经建立好了，帐号为#{u.email}, 密码为#{u.password}"
else
puts "User 已经建立过了，帐号: think72013@aliyun.com , 密码: 12345678 , 脚本跳过该步骤。"
end

# #无法执行 rake db:seed 来创建job ,可能是因为数据库作了job与user的关联，要记录是谁创建job

# #Initialize Job

# create_job = for i in 1..10 do
#   Job.create!([title: "Job no.#{i}", description: "这是用seeds文件建立的第 #{i} 个公开的工作", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, is_hidden: "false"])
# end
# create_job = for i in 1..10 do
#   Job.create!([title: "Job no.#{i}", description: "这是用seeds文件建立的第 #{i} 个隐藏的工作", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, is_hidden: "true"])
# end
#
# puts "10 Public jobs created."
# puts "10 Hidden jobs created."

Job.create!(title: "设计师",  # job.create!   如果可以，有 ! 号才能创建
  brand: "欧派",
  description: "1、要懂圆方软件、CAD,有相关橱柜衣柜或家具设计经验优先；
  2、设计专业毕业，拥有很强的设计概念；
  3、有良好的沟通表达能力，工作认真负责，富于团队合作精神，责任感。",
  wage_lower_bound: 5,
  wage_upper_bound: 7,
  location:"世邦二楼",
  contact_email: "a.liudezhi@gmail.com",
  is_hidden: false)

  Job.create(title:"家居顾问",brand:"尚品宅配",description:"1、负责店面接待工作，为客户提供亲情服务，介绍公司品牌／产品，引导客户进店体验全屋家具；
  2、负责店面引流活动执行，通过活动获取客户预留信息，客户信息中挖掘量尺机会并跟进实量尺；
  3、协助上级完成店面各类管理报表填写工作及店面5S日常维护；
  4薪资待遇：底薪+提成+五险一金+激励奖金+交通补+话补",
  wage_lower_bound: 3, wage_upper_bound: 8, location:"世邦二楼2032",
  contact_email: "a.liudezhi@gmail.com",is_hidden: false)

  Job.create(title:"店长",brand:"友邦吊顶",description:"男女不限，有多年建材销售经验，销售能力强；具体较强的管理和协调能力；心态稳定，能和企业一起成长；高中以上学历，年薪12-18万",
  wage_lower_bound: 8, wage_upper_bound: 18, location:"世邦一楼1044",
  contact_email: "a.liudezhi@gmail.com",is_hidden: false)

  Job.create(title:"家居顾问",brand:"诗维馆",
  description:"岗位要求：
  1、年 龄：21-35岁；
  2、性 别：性别不限；
  3、学 历：高中、中专以上学历；
  4、经验要求：1年以上同类型岗位从业经验；
  5、知识要求：熟悉家具行业的相关销售技巧；
  6、能力要求：了解word、excel等办公软件基本操作；具备良好的应变能力及谈判能力；
  7、其它要求：亲和力强、沟通能力强、形象气质佳。",
  wage_lower_bound: 3, wage_upper_bound: 5, location:"世邦一楼1025",
  contact_email: "a.liudezhi@gmail.com",is_hidden: false)

  Job.create(title:"推广专员",brand:"索非亚",description:"1、有良好的沟通能力；
  2、有建材销售经验或策划者优先",
  wage_lower_bound: 4, wage_upper_bound: 8, location:"世邦二楼",
  contact_email: "a.liudezhi@gmail.com",is_hidden: false)

  Job.create(title:"家居顾问",brand:"京瓷家具",description:"主要负责店面商品销售工作，年龄在20岁～30岁左右，学历高中或中专以上，性格开朗善于沟通，有团队协助精神，精通国，粤语和有销售经验者优先",
  wage_lower_bound: 3, wage_upper_bound: 5, location:"世邦四楼4039号",
  contact_email: "a.liudezhi@gmail.com",is_hidden: false)

  Job.create(title:"导购销售",brand:"好莱客衣柜",description:"职位描述 1.对销售有浓厚的兴趣，对市场敏锐的洞察力；有较强的语言表达能力及团队合作精神。
  2. 具备独立应对问题的应变能力；能独立完成与客户的洽谈和签订合同等相关事宜；
  3.具有优秀的营销技巧。
  4.诚信敬业，具有服务意识，学习领悟能力强，性格开朗。
  5.工资结构：底薪+提成+奖金+社保.",
  wage_lower_bound: 4, wage_upper_bound: 9, location:"世邦三楼3064号",
  contact_email: "a.liudezhi@gmail.com",is_hidden: false)

  Job.create(title:"设计师",brand:"简一",description:"职位介绍：1、熟练使用Flash、草图大师、3Dmax、Photoshop、CAD，360度全景效果等绘图和建模设计软件；
  2、建模能力强、熟练使用VR渲染／ps后期制作；
  3、能熟练阅读图纸及设计师手稿草图，独立完成整个效果图制作过程；

  岗位需求：
  1、建筑装饰／室内设计专业大专以上学历；
  2、三年以上工作经验，具备客户谈单能力，快速促成。
  3、工作勤奋、踏实、有较强的团队合作精神，具备较强的学习能力，积极进取。",wage_lower_bound: 4, wage_upper_bound: 10, location:"世邦负一楼",
  contact_email: "a.liudezhi@gmail.com",is_hidden: false)

  Job.create(title:"销售代表",brand:"慕思",description:"主要负责店面商品销售工作，年龄在20岁～30岁左右，学历高中或中专以上，性格开朗善于沟通，有团队协助精神，精通国，粤语和有销售经验者优先",
  wage_lower_bound: 3, wage_upper_bound: 5, location:"世邦三楼",
  contact_email: "a.liudezhi@gmail.com",is_hidden: false)

  Job.create(title:"业务经理",brand:"简一",description:"职位介绍：1、负责大客户的开拓，建立稳定的客户关系；
  2、进行商务谈判，参与销售合同的制定；
  3、性格外向，具有同行业工作经验优先，持强烈的事业心及挑战精神，肯吃苦；
  4、具备良好的学习能力，强烈的市场竞争意识。",
  wage_lower_bound: 3, wage_upper_bound: 12, location:"世邦负一楼",
  contact_email: "a.liudezhi@gmail.com",is_hidden: false)
