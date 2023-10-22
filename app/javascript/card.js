const pay = ()=>{
  const publicKey = gon.public_key;
  const payjp = Payjp(publicKey);
  const elements = payjp.elements();
  const numberElement = elements.create("cardNumber");
  const expiryElement = elements.create("cardExpiry");
  const cvcElement = elements.create("cardCvc");

  numberElement.mount("#number-form");
  expiryElement.mount("#expiry-form");
  cvcElement.mount("#cvc-form");

  const form = document.getElementById("charge-form")

  form.addEventListener("submit", (e)=>{
    payjp.createToken(numberElement).then((response)=>{
      if (response.error) {
      } else {
        const token = response.id;
        form.insertAdjacentHTML("beforeend", `<input value=${token} name="token" type="hidden">`);
      };
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      form.submit();
    });
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);