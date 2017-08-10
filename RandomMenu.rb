adjective = ["hot", "spicy", "cool", "tender", "numbing", "citrusy", "garlic", "sour", "salty", "smoky"]
style = ["baked", "pan-fried", "steamed", "pressure-cooked", "grilled", "tandoori", "dehydrated", "smoked", "deep-fried", "microwaved"]
food = ["pork chop", "duck", "chimichanga", "sushi", "rack of lamb", "mixed vegetables", "cake", "tofu", "dumplings", "salmon"]

puts "Welcome to the menu!"

#accept user input on the menu items
puts %{Would you like to add any menu items? If yes, enter "adjective", "style", or "food". Otherwise, please enter "no".}
update = ""
until update == "no"
  update = gets.chomp.to_s.downcase
  case update
    when "no"
    when "adjective", "style", "food"
      puts "Please enter the #{update} you'd like to add to the menu."
      add = gets.chomp.to_s
      adjective.push(add) if update == "adjective"
      style.push(add) if update == "style"
      food.push(add) if update == "food"
      puts %{Would you like to add any other menu items? If yes, enter "adjective", "style", or "food". Otherwise, please enter "no".}
    else
      puts %{I'm sorry, I didn't understand. If you'd like to add menu items, please enter "adjective", "style", or "food". Otherwise, please enter "no".}
  end
end

# accept user input on the number of menu items displayed
num = 0
max = [adjective.length, style.length, food.length].sort.first
until num > 0 && num <= max
  puts "How many items would you like to see? Please choose a number between 1 and #{max}."
  num = gets.chomp.to_i
end

# display menu items requested
(1..num).each do |i|
  item_adjective = adjective.sample
  adjective.delete(item_adjective)
  item_style = style.sample
  style.delete(item_style)
  item_food = food.sample
  food.delete(item_food)
  puts "#{i}. #{item_adjective} #{item_style} #{item_food}"
end
