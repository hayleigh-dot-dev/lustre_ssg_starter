// IMPORTS ---------------------------------------------------------------------

import gleam/list
import lustre/attribute.{attribute}
import lustre/element.{Element}
import lustre/element/html.{html}
import lustre/ssg
import content.{Content}
import content/index

// MAIN ------------------------------------------------------------------------

pub fn main() {
  ssg.new("./dist")
  |> ssg.add_static_route("/", page(index.content, "Home"))
  |> ssg.add_static_dir("./static")
  |> ssg.use_index_routes
  |> ssg.build
}

fn page(content: List(Content), title: String) -> Element(msg) {
  html(
    [attribute("lang", "en"), attribute.class("overflow-x-hidden")],
    [
      html.head(
        [],
        [
          html.title([], title),
          html.meta([attribute("charset", "utf-8")]),
          html.meta([
            attribute("name", "viewport"),
            attribute("content", "width=device-width, initial-scale=1"),
          ]),
          html.link([
            attribute.href("/pico.min.css"),
            attribute.rel("stylesheet"),
          ]),
          html.style(
            [],
            " body > div {
                max-width: 60ch;
                margin: 0 auto;
                padding-top: 2rem;
              }
            ",
          ),
        ],
      ),
      html.body([], [html.div([], list.map(content, content.view))]),
    ],
  )
}
