import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { default: String }
  static targets = ["section", "tab"]
  static classes = [
    "sectionSelected",
    "sectionDefault",
    "tabSelected",
    "tabDefault",
  ]

  select(e) {
    this.tabTargets.forEach((tab) => {
      if (tab === e.target) {
        tab.classList.add(...this.tabSelectedClasses)
        tab.classList.remove(...this.tabDefaultClasses)
      } else {
        tab.classList.add(...this.tabDefaultClasses)
        tab.classList.remove(...this.tabSelectedClasses)
      }
    })

    this.sectionTargets.forEach((section) => {
      if (`#${section.id}` === e.target.getAttribute("href")) {
        section.classList.add(...this.sectionSelectedClasses)
        section.classList.remove(...this.sectionDefaultClasses)

      } else {
        section.classList.add(...this.sectionDefaultClasses)
        section.classList.remove(...this.sectionSelectedClasses)
      }
    })

    e.preventDefault()
  }

  tabTargetConnected(tab) {
    if (tab.getAttribute("href") === this.defaultValue) {
      tab.classList.add(...this.tabSelectedClasses)
      tab.classList.remove(...this.tabDefaultClasses)
    } else {
      tab.classList.add(...this.tabDefaultClasses)
      tab.classList.remove(...this.tabSelectedClasses)
    }
  }

  sectionTargetConnected(section) {
    if (`#${section.id}` === this.defaultValue) {
      section.classList.add(...this.sectionSelectedClasses)
      section.classList.remove(...this.sectionDefaultClasses)

    } else {
      section.classList.add(...this.sectionDefaultClasses)
      section.classList.remove(...this.sectionSelectedClasses)
    }
  }
}
