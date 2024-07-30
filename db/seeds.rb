CatRentalRequest.destroy_all
Cat.destroy_all

miguel = Cat.create!(
  birth_date: "2023/7/28",
  name: "Miguel",
  color: "orange",
  description: "I found white in the streets",
  sex: "M"
)

perla = Cat.create!(
  birth_date: "2015/4/15",
  name: "Perla",
  color: "black",
  description: "I found perla in the streets",
  sex: "F"
)

CatRentalRequest.create!(cat_id: miguel.id, status: "APPROVED", start_date: "2022/07/12", end_date: "2023/07/12")
CatRentalRequest.create!(cat_id: miguel.id, status: "PENDING", start_date: "2023/07/13", end_date: "2024/07/12")

# CatRentalRequest.create!(cat_id: perla.id, status: "PENDING", start_date: "2022/07/12", end_date: "2023/07/12")


