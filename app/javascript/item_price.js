window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;// 商品の価格（売値）
   

    const addTaxDom = document.getElementById("add-tax-price");
    const commissionRate = 0.1; // 手数料率（10%）
    addTaxDom.innerHTML = Math.trunc(inputValue * commissionRate);

    const profit_price = document.getElementById("profit");
    profit_price.innerHTML = inputValue - Math.trunc(inputValue * commissionRate);
  })

})