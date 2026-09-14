#{
  import "typst-templates/style.typ": apply_styles
  import "typst-templates/titlepage.typ": titlepage

  show: apply_styles
  show heading.where(level: 2): set heading(numbering: none)
  show heading: set align(center)

  set heading(numbering: (..nums) => "")

  show heading.where(level: 1): it => {
    counter(figure.where(kind: image)).update(0)
    it
  }

  set figure(numbering: (..nums) => {
    context {
      let character-num = counter(heading).get().at(0)
      let figure-num = nums.pos().at(0)
      return numbering("1.1", character-num, figure-num)
    }
  })

  show "->": sym.arrow.r

  titlepage(
    "Островский В.Ю.",
    ("", 4352, "Даричев Е.М."),
    ("ка", 4352, "Макарова Ю.И."),
    ("", 4352, "Чехонадских Н.А."),
    department: "САПР",
    discipline: "Геометрическое моделирование",
    number: "№1",  // TODO: bump version
  )
  set par(justify: true)

  outline(depth: 1)
  pagebreak()

  include "parts/lab1.typ"
}
