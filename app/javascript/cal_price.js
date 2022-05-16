function calPrice(){
  const itemPrice = document.getElementById('item-price');
  const tax = 0.1;
  itemPrice.addEventListener('keyup', () => {
    const addTax = Math.floor(itemPrice.value * tax);
    const addTaxPrice = document.getElementById('add-tax-price');
    const Profit = document.getElementById('profit');
    addTaxPrice.innerHTML = `${addTax}`;
    Profit.innerHTML = `${itemPrice.value - addTax}`;
  });
};

window.addEventListener('load', calPrice);

