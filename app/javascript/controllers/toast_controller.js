import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["toast"];

  connect() {
    this.toastTargets.forEach((toast, index) => {
      setTimeout(() => {
        toast.classList.remove("translate-x-full");
        toast.classList.add("translate-x-0");
      }, index * 200);

      setTimeout(() => {
        this.dismiss(toast);
      }, 5000 + index * 200);
    });
  }

  dismiss(element) {
    element.classList.remove("translate-x-0");
    element.classList.add("translate-x-full");

    setTimeout(() => {
      element.remove();
    }, 300);
  }
}
