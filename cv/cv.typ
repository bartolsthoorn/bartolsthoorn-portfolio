#let accent = rgb("#5e6e2f")
#let muted  = rgb("#5f6a58")
#let fg     = rgb("#2e342a")

#set document(
  title: "Bart Olsthoorn — CV",
  author: "Bart Olsthoorn",
)

#set page(
  paper: "a4",
  margin: (x: 18mm, top: 16mm, bottom: 16mm),
)

#let serif = ("Charter", "New York", "Georgia")

#set text(
  font: serif,
  size: 10pt,
  fill: fg,
  lang: "en",
  hyphenate: false,
)

#set par(justify: false, leading: 0.55em)

#show link: it => text(fill: accent, underline(it))

#let section(title) = {
  v(6pt)
  block(
    text(
      font: serif,
      size: 12pt,
      weight: "medium",
      title,
    )
  )
  v(-4pt)
  line(length: 100%, stroke: 0.5pt + muted.lighten(40%))
  v(0pt)
}

#let entry(dates, title, meta: none, body: none) = {
  grid(
    columns: (72pt, 1fr),
    column-gutter: 14pt,
    row-gutter: 0pt,
    text(fill: muted, size: 9pt)[#dates],
    {
      text(weight: "semibold")[#title]
      if meta != none {
        linebreak()
        text(fill: muted, size: 9.5pt)[#meta]
      }
      if body != none {
        linebreak()
        text(size: 9.5pt)[#body]
      }
    }
  )
  v(3pt)
}

#let role(dates, title, body) = {
  grid(
    columns: (92pt, 1fr),
    column-gutter: 10pt,
    row-gutter: 0pt,
    text(fill: muted, size: 8.5pt)[#dates],
    {
      text(size: 9.5pt, weight: "medium")[#title]
      linebreak()
      text(size: 9.5pt)[#body]
    }
  )
  v(3pt)
}

// ── Header ──────────────────────────────────────────────────────────────────

#align(center)[
  #text(
    font: serif,
    size: 19pt,
    weight: "semibold",
  )[Bart Olsthoorn]

  #v(-4pt)
  #text(fill: muted, size: 10.5pt)[
    Ph.D. in Physics · Product Engineer at Flower
  ]

  #v(2pt)
  #text(size: 9.5pt)[
    Stockholm, Sweden
    · #link("mailto:bart.olsthoorn@gmail.com")[bart.olsthoorn\@gmail.com]
    · #link("https://bartolsthoorn.nl")[bartolsthoorn.nl]
    · #link("https://github.com/bartolsthoorn")[github.com/bartolsthoorn]
    · #link("https://www.linkedin.com/in/bart-olsthoorn-67423613/")[linkedin]
  ]
]

#v(10pt)

// ── Profile ─────────────────────────────────────────────────────────────────

#section[Profile]

Software engineer with a physics Ph.D., now building product and
infrastructure for distributed energy assets: batteries, solar, EVs,
heat pumps. Equally comfortable building products, leading a small
team, or training a model.

// ── Experience ──────────────────────────────────────────────────────────────

#section[Experience]

#entry(
  "2023 – now",
  [#link("https://flower.se")[Flower]],
  meta: [Stockholm · Go, AWS],
)

#role(
  "Feb 2026 – now",
  [Product Owner / Product Engineer · Distributed Assets],
  [
    Leveraging AI to build our systems while supporting the team on
    business meetings and prioritisation.
  ],
)

#role(
  "Dec 2024 – Feb 2026",
  [Software Engineer · Distributed Assets],
  [
    Developed Flower Bridge, the integration API for distributed energy
    assets: residential and C&I batteries, solar, EVs, heat pumps.
  ],
)

#role(
  "Jan 2024 – Dec 2024",
  [Engineering Manager (interim) · Asset Management],
  [Technical recruiting and team leadership during a growth phase.],
)

#role(
  "Feb 2023 – Jan 2024",
  [Software Engineer · Asset Management],
  [
    Built a platform supporting the Nordic electrical grid with grid-scale
    solar and battery systems.
  ],
)

#entry(
  "2012 – 2017",
  [Freelance Software Engineer],
  meta: [Stockholm, Sweden and Leiden, The Netherlands],
  body: [
    Shipped production software across a range of stacks and domains:
    early generative AI with PyTorch / GANs at _Similar.ai_; Ruby and
    Elixir work on search, recommendations, and deduplication at
    _Universal Avenue_ (now Velory); scalable Rails SaaS at _InnerBalloons_
    (acquired by Yext) and web-data systems at _Pointer Brand Protection_.
  ],
)

// ── Education ───────────────────────────────────────────────────────────────

#section[Education]

#entry(
  "2018 – 2023",
  [Ph.D., Physics · KTH Royal Institute of Technology],
  body: [
    Thesis: _Homology and machine learning for materials informatics._
    11 peer-reviewed publications.
  ],
)

#entry(
  "2015 – 2018",
  [M.Sc., Computational Physics · Stockholm University],
)

// ── Selected publications ───────────────────────────────────────────────────

#section[Selected publications]

#entry(
  "2023",
  [Persistent homology of quantum entanglement],
  meta: [Physical Review B · Editors' Suggestion ·
    #link("https://journals.aps.org/prb/abstract/10.1103/PhysRevB.107.115174")[link]],
)

#entry(
  "2019",
  [Band gap prediction for large organic crystal structures with machine learning],
  meta: [Advanced Quantum Technologies ·
    #link("https://onlinelibrary.wiley.com/doi/10.1002/qute.201900023")[link]],
)

#text(size: 9.5pt, fill: muted)[
  Full list on
  #link("https://scholar.google.se/citations?user=6NPz_KcAAAAJ")[Google Scholar].
]

// ── Open source ─────────────────────────────────────────────────────────────

#section[Open source]

500+ stars across repositories on
#link("https://github.com/bartolsthoorn")[github.com/bartolsthoorn].
Highlights:
#link("https://github.com/bartolsthoorn/NVDSP")[NVDSP] — iOS / macOS audio DSP library (417★);
#link("https://github.com/bartolsthoorn/NQS-numpy")[NQS-numpy] — neural-network quantum states in NumPy (35★);
#link("https://github.com/bartolsthoorn/gohighs")[gohighs] — Go bindings for the HiGHS optimizer.

// ── Skills & languages ──────────────────────────────────────────────────────

#section[Skills & languages]

#grid(
  columns: (72pt, 1fr),
  column-gutter: 14pt,
  row-gutter: 4pt,
  text(fill: muted, size: 9pt)[Core],
  [Go, Python, AWS, Databricks, PostgreSQL, distributed systems, product engineering],

  text(fill: muted, size: 9pt)[Past],
  [Ruby / Rails, Elixir, PyTorch, Swift / Objective-C],

  text(fill: muted, size: 9pt)[Research],
  [Machine learning for materials, topological data analysis, quantum systems],

  text(fill: muted, size: 9pt)[Languages],
  [English, Dutch (native), Swedish (working)],
)
