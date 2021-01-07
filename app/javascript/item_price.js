
function displayPrice() {
  const priceInput = document.getElementById("item-price");
  const taxPriceInput = document.getElementById("add-tax-price");
  const profitInput = document.getElementById("profit");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    // 販売手数料を表示させる
    taxPriceInput.innerHTML = Math.floor(inputValue * 0.1)

    // 販売利益を表示させる
    profitInput.innerHTML = Math.floor(inputValue - taxPriceInput.innerHTML)
 })
}

window.addEventListener('load', displayPrice)