function commission() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input",()=>{
    const itemCommission = Math.floor(itemPrice.value / 10);
    document.getElementById("add-tax-price").innerHTML = itemCommission;
    document.getElementById("profit").innerHTML = itemPrice.value - itemCommission;
  });
};

window.addEventListener("turbo:load", commission);