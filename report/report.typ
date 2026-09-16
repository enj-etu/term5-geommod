#{
  import "typst-templates/style.typ": apply_styles
  import "typst-templates/titlepage.typ": titlepage

  show: apply_styles

  show heading: set align(center)
  show heading: set heading(numbering: (..nums) => "")

  // figure numbering scripts 
  show heading.where(level: 1): it => {
    counter(figure.where(kind: image)).update(0)
    it
  }
  set figure(numbering: (first, ..) => {
    context {
      let character-num = counter(heading).get().at(0)
      return numbering("1.1", character-num, first)
    }
  })

  show "->": sym.arrow.r

  titlepage(
    "Островский В.Ю.",
    ("", 4352, "Даричев Е.М."),
    ("ка", 4352, "Макарова Ю.И."),
    ("", 4352, "Чехонадских Н.А."),
    department: [САПР],
    discipline: [Геометрическое моделирование],
    number: [№1-4],  // TODO: bump version
  )

  set par(
    justify: true,
    first-line-indent: (
      amount: 1.25cm,
      all: true
    ),
    leading: 1em
  )

  outline(depth: 1)
  pagebreak()

  include "parts/lab1.typ"
  pagebreak()
  include "parts/lab2.typ"
  pagebreak()
  include "parts/lab3.typ"
  pagebreak()
  include "parts/lab4.typ"
}
