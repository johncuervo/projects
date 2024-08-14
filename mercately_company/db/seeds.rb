# Create new items for the first time
items_data = [
  { name: 'Men\'s Denim Jacket', description: 'Classic denim jacket with a modern fit and durable denim fabric.', price: 69.99, img_url: 'https://www.shutterstock.com/shutterstock/photos/1243025647/display_1500/stock-photo-stylish-blue-men-s-jeans-jacket-isolated-on-white-background-ghost-mannequin-photography-1243025647.jpg' },
  { name: 'Women\'s Linen Dress', description: 'Lightweight and breathable linen dress, perfect for summer days.', price: 49.99, img_url: 'https://www.shutterstock.com/shutterstock/photos/2234796249/display_1500/stock-photo-series-of-studio-photos-of-young-female-model-in-white-midi-dress-2234796249.jpg' },
  { name: 'Unisex Cotton Hoodie', description: 'Soft and comfortable cotton hoodie with a cozy fleece lining.', price: 39.99, img_url: 'https://www.shutterstock.com/shutterstock/photos/1869032191/display_1500/stock-photo-blank-white-sport-hoodie-with-hood-mockup-gray-background-d-rendering-empty-fleece-sweatshirt-1869032191.jpg' },
  { name: 'Men\'s Slim Fit Jeans', description: 'Stylish slim fit jeans made from stretch denim for flexibility and comfort.', price: 59.99, img_url: 'https://www.shutterstock.com/shutterstock/photos/163308287/display_1500/stock-vector-denim-163308287.jpg' },
  { name: 'Women\'s Athletic Leggings', description: 'High-waisted athletic leggings with moisture-wicking fabric for workouts.', price: 29.99, img_url: 'https://www.shutterstock.com/shutterstock/photos/2191906701/display_1500/stock-vector-abstract-background-style-for-sports-leggings-2191906701.jpg' },
  { name: 'Children\'s Graphic T-Shirt', description: 'Fun and colorful graphic T-shirt for kids made from soft cotton.', price: 14.99, img_url: 'https://www.shutterstock.com/shutterstock/photos/2148764041/display_1500/stock-vector-brave-skater-vector-penguin-cartoon-graphic-t-shirt-illustration-design-2148764041.jpg' }
]

# Create items
items_data.each do |item_data|
  Item.create!(item_data)
end
