import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  connect() {
    const submit = document.getElementById("submitbtn");
    const input = document.getElementById("query");
    const ip = document.getElementById("ip");

    submit.addEventListener("click", () => {
      if (input.value.length > 3) {
        this.postForm({ search_query: input.value.toLowerCase(), user_ip: ip.value })
      }
    });

    input.addEventListener("focusout", () => {
      submit.click();
    });
  }
  
  async postForm(data) {
    await fetch("/searches", {
      method: "POST",
      body: JSON.stringify(data),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    })
  }

  search() {
    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      this.element.requestSubmit();
    }, 200);
  }
}
