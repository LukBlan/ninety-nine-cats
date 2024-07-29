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

perla.save
miguel.save

