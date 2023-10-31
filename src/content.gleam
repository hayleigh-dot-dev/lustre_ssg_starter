import gleam/list
import lustre/attribute.{attribute}
import lustre/element.{Element}
import lustre/element/html

pub type Content {
  Title(String)
  Heading(String)
  Subheading(String)
  Section(List(InlineContent))
  Snippet(lang: String, code: String)
}

pub type InlineContent {
  Bold(String)
  Code(String)
  Link(href: String, text: String)
  Text(String)
}

pub fn view(content: Content) -> Element(msg) {
  case content {
    Title(text) -> html.h1([], [element.text(text)])
    Heading(text) -> html.h2([], [element.text(text)])
    Subheading(text) -> html.h3([], [element.text(text)])
    Section(content) -> html.p([], list.map(content, view_inline))
    Snippet(lang, code) ->
      html.pre(
        [attribute("data-lang", lang)],
        [html.code([], [element.text(code)])],
      )
  }
}

fn view_inline(content: InlineContent) -> Element(msg) {
  case content {
    Bold(text) -> html.strong([], [element.text(text)])
    Code(text) -> html.code([], [element.text(text)])
    Link(href, text) -> html.a([attribute("href", href)], [element.text(text)])
    Text(text) -> element.text(text)
  }
}
