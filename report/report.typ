#{
  import "typst-templates/style.typ": apply_styles

  show: apply_styles

  show heading: set align(center)
  show heading: set heading(numbering: (..nums) => "")

  // figure numbering scripts
  show heading.where(level: 1): it => {
    counter(figure.where(kind: image)).update(0)
    it
  }
  set figure(numbering: (first, ..) => context {
    let character-num = counter(heading).get().at(0)
    return numbering("1.1", character-num, first)
  })

  show "->": sym.arrow.r

    text(weight: "bold")[
    #align(center + top)[
      МИНОБРНАУКИ РОССИИ \
      САНКТ-ПЕТЕРБУРГСКИЙ ГОСУДАРСТВЕННЫЙ \
      ЭЛЕКТРОТЕХНИЧЕСКИЙ УНИВЕРСИТЕТ \
      "ЛЭТИ" ИМ. В.И. УЛЬЯНОВА (ЛЕНИНА)\
            Кафедра САПР
    ]
    // #v(14pt * 10)
    #align(center + horizon)[
      ОТЧЁТ\
      по лабораторным работам №1-9\
        по дисциплине "Геометрическое моделирование"
    ]

    ]
    align(center + bottom)[
      #grid(
        columns: (1fr, 1fr, 1fr),
        rows: 1.08cm,
        align: (left, left, left),
        "Преподаватель","_______________", "Островский В.Ю.",
    "Студент гр. 4352","_______________", "Даричев Е.М.",
    "Студентка гр. 4352","_______________", "Макарова Ю.И.",
    "Студент гр. 4352", "_______________","Чехонадских Н.А.",
      )

      #v(3cm)
      Санкт-Петербург\
      2026
    ]
    pagebreak()

  set par(
    justify: true,
    first-line-indent: (
      amount: 1.25cm,
      all: true,
    ),
    leading: 1em,
  )

  outline(depth: 1)
  counter(heading).update(0)

  pagebreak()
  include "parts/lab1.typ"
  pagebreak()
  include "parts/lab2.typ"
  pagebreak()
  include "parts/lab3.typ"
  pagebreak()
  include "parts/lab4.typ"
  pagebreak()
  include "parts/lab5.typ"
  pagebreak()
include "parts/lab6.typ"
  pagebreak()
include "parts/lab7-8.typ"
  pagebreak()
include "parts/lab9.typ"
}
