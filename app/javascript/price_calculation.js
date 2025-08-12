const price = () => {
  const priceInput = document.getElementById('item-price');
  const taxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (!priceInput) return; 

  const calculateAndDisplay = () => {
    const price = parseInt(priceInput.value, 10);

    if (!price || price < 0) {
      taxPrice.textContent = '';
      profit.textContent = '';
      return;
    }

    const fee = Math.floor(price * 0.1);
    taxPrice.textContent = fee.toLocaleString();
    profit.textContent = (price - fee).toLocaleString();
  };

  priceInput.addEventListener('input', calculateAndDisplay);

  if (priceInput.value) {
    calculateAndDisplay();
  }
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);

