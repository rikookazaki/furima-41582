function calculate(){
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit= document.getElementById("profit");

  price.addEventListener('input', () => {
    const priceValue = price.value;
    const priceNumber = parseFloat(priceValue); 

    const taxNumber = Math.floor(priceNumber * 0.1);
    tax.innerHTML = taxNumber.toString(); 

    const profitNumber = Math.floor(priceNumber - taxNumber);
    profit.innerHTML = profitNumber.toString(); 
    
  });
};

window.addEventListener('turbo:load', calculate);
