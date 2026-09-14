#let fig = (filepath, ..args) => {
  let (.., filename) = filepath.split("/")
  let (.., caption, _) = filename.split(regex(" - |\."))

  return figure(
    caption: caption,
    image(filepath),
    ..args
  )
}

#let i = (it) => text(style: "italic")[#it]
