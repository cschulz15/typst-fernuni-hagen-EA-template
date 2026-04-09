#let meta = (
  name: "Max Mustermann",
  matrikel: "1234567",
  modul: "Einführung in die lineare Algebra",
  einsende_nr: "1",
  datum: "01.05.2026",
)

// ---------- Basis-Layout ----------
#set page(
  size: A4,
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
)

#set text(
  font: "Libertinus Serif",
  size: 11pt,
  line-height: 1.5,
)

#set math(
  style: "display",
)

// ---------- Kopf-/Fußzeile ----------
#let layout(meta) = {
  #set page(
    header: [
      #box(height: 1.5em)[
        #text(size: 8.5pt, fill: gray)[
          #meta.name — Matrikel: #meta.matrikel \
          #meta.modul — EA #meta.einsende_nr
        ]
      ]
    ],
    footer: [
      #align(right)[
        #text(size: 8.5pt, fill: gray)[
          Seite #counter(page).display() von #counter(page).final()
        ]
      ]
    ]
  )
}

// ---------- Deckblatt ----------
#let deckblatt(meta, aufgabe_nr) = [
  #align(center)[
    #v(3.5cm)

    #image("fernuni-logo.png", width: 5.5cm)

    #v(2.5cm)

    #text(size: 22pt, weight: "bold")[
      Einsendeaufgabe #meta.einsende_nr
    ]

    #v(0.5em)

    #text(size: 16pt, fill: gray.darken(20%))[
      Aufgabe #aufgabe_nr
    ]

    #v(2.5cm)

    #text(size: 12pt, weight: "semibold")[
      #meta.modul
    ]

    #v(3cm)

    #box(
      stroke: 0.5pt + gray.lighten(40%),
      inset: 1em,
      radius: 4pt
    )[
      #grid(
        columns: (1fr, 1fr),
        gutter: 0.5em,
        [
          *Name:* #meta.name \
          *Matrikelnummer:* #meta.matrikel
        ],
        [
          *Datum:* #meta.datum
        ]
      )
    ]
  ]

  #pagebreak()
]

// ---------- Überschriften ----------
#show heading.where(level: 1): it => {
  #v(1em)
  #text(size: 14pt, weight: "bold")[#it.body]
  #v(0.3em)
  #line(length: 100%, stroke: 1pt)
  #v(0.8em)
}

#show heading.where(level: 2): it => {
  #v(0.8em)
  #text(size: 12pt, weight: "semibold")[#it.body]
  #v(0.4em)
}

// ---------- Hauptfunktion ----------
#let aufgabe(meta, aufgabe_nr, body) = {
  #deckblatt(meta, aufgabe_nr)
  #layout(meta)

  #heading(level: 1)[Aufgabe #aufgabe_nr]
  #body
}

// ---------- Lösung ----------
#let loesung(body) = [
  #heading(level: 2)[Lösung]

  #block(inset: (left: 1em))[
    #body
  ]
]
