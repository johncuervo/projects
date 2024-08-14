import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["quantity", "cartItems", "orderItemsInput", "orderForm"]

  connect() {
    this.cart = this.loadCart()
    this.updateCartView()
  }

  addToCart(event) {
    const itemId = event.target.dataset.itemId
    const itemName = event.target.dataset.itemName
    const itemPrice = parseFloat(event.target.dataset.itemPrice)
    const quantity = parseInt(this.quantityTargets.find(input => input.id === `quantity_${itemId}`).value)

    if (this.cart[itemId]) {
      this.cart[itemId].quantity += quantity
    } else {
      this.cart[itemId] = { id: itemId, name: itemName, price: itemPrice, quantity: quantity }
    }

    this.saveCart()
    this.updateCartView()
  }

  createOrder(event) {
    event.preventDefault()

    this.cart = this.loadCart()

    if (!this.cart || Object.keys(this.cart).length === 0) {
      alert("Your cart is empty. Please add items to the cart before placing an order.")
      return
    }

    this.orderItemsInputTarget.value = JSON.stringify(this.cart)
    this.orderFormTarget.submit()
  }

  updateCartView() {
    if (typeof this.cart === 'object' && Object.keys(this.cart).length > 0) {
      let cartItemsHTML = ''
      let total = 0

      for (const itemId in this.cart) {
        const item = this.cart[itemId]
        const itemTotal = item.price * item.quantity
        total += itemTotal

        cartItemsHTML += `<tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                            <td class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">${item.name}<input type="hidden" value="${item.id}"></td>
                            <td class="px-6 py-4">${item.quantity}</td>
                            <td class="px-6 py-4">$${itemTotal.toFixed(2)}</td>
                          </tr>`
      }

      const cartItemsElement = document.getElementById('cart-items')
      if (cartItemsElement) {
        cartItemsElement.innerHTML = cartItemsHTML
      } else {
        console.warn('Cart items element not found.')
      }

      const cartTotalElement = document.getElementById('cart-total')
      if (cartTotalElement) {
        cartTotalElement.textContent = `$${total.toFixed(2)}`
      } else {
        console.warn('Cart total element not found.')
      }
    }
  }

  saveCart() {
    localStorage.setItem('cart', JSON.stringify(this.cart))
  }

  loadCart() {
    const savedCart = localStorage.getItem('cart')
    return savedCart ? JSON.parse(savedCart) : {}
  }
}
