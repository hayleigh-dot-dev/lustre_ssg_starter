# Lustre_ssg start template

This is a dead simple demo repo to show you how to get started _today_ with
lustre and lustre_ssg. We're missing lots of using things that would make this
experience nicer - most notably a nice markdown parser.

As a semi-workaround. This template repo defines a `Content` type (and a companion
`InlineContent` type) that lets you write content in a slightly more focused
manner than just directly writing the HTML.

We use PicoCSS as a sensible drop-in CSS framework.

## Getting started

Run `gleam run -m build` to generate the static HTML for your site. How you serve
it is up to you: everything you need to serve will be in the `dist/` directory.

## Adding pages

Add a new page by creating another gleam file inside `src/content/`. From there
import all the constructors you need from `content` and define a public const.
Each page should look something like:

```gleam
import content.{Title, Section, Text}

pub const content = [
  Title("This is a page),
  Section([
    Text("Here is some content!")
  ])
]
```

Then head over to the build script, import your new page, and add it to the
pipeline:

```gleam
pub fn main() {
  ssg.new("./dist")
  |> ssg.add_static_route("/", page(index.content, "Home"))
  |> ssg.add_static_route("/your-new-page", page(your_new_page.content, "Your new page!"))
  |> ...

```
