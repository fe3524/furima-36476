const pay = () => {
  Payjp.setPublicKey("pk_test_b993505000919d0533fd3164"); // PAY.jpテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("history[number]"),
      cvc: formData.get("history[cvc]"),
      exp_month: formData.get("history[exp_month]"),
      exp_year: `20${formData.get("history[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);