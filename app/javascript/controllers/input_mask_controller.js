import { Controller } from "@hotwired/stimulus"
import IMask from "imask"

// Applies an input mask via imask (https://imask.js.org).
//
// Pattern mask (phone, CPF, CNPJ, CEP, ...):
//   data-controller="input-mask" data-input-mask-mask-value="(00) 00000-0000"
//
// Currency mask (BRL money):
//   data-controller="input-mask" data-input-mask-currency-value="true"
export default class extends Controller {
  static values = { mask: String, currency: Boolean }

  connect() {
    this.mask = IMask(this.element, this.options)
  }

  disconnect() {
    this.mask?.destroy()
  }

  get options() {
    if (this.currencyValue) {
      return {
        mask: "R$ num",
        blocks: {
          num: {
            mask: Number,
            thousandsSeparator: ".",
            radix: ",",
            scale: 2,
            padFractionalZeros: true,
            normalizeZeros: true
          }
        }
      }
    }

    return { mask: this.maskValue }
  }
}
