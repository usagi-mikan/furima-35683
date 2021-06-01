window.addEventListener('load', () => {
  console.log("OK");

// 金額を入力した数値をpriceInputという変数に格納する
  const priceInput = document.getElementById("item-price");

    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      console.log(inputValue);

      const addTaxDom = document.getElementById("add-tax-price")
      addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
      console.log(addTaxDom);

      const profitNumber = document.getElementById("profit")
      profitNumber.innerHTML = (Math.floor(inputValue * 0.9));
      console.log(profitNumber);

    })

})
