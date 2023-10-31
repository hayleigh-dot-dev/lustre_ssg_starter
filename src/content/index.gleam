import content.{Bold, Code, Heading, Section, Snippet, Subheading, Text, Title}

pub const content = [
  Title("Hello, world!"),
  Section([Text("This is my first post!")]),
  Heading("We can write code snippets..."),
  Snippet(
    "gleam",
    "import gleam/io

pub fn main() {
  io.println(\"Hello, world!\")
}",
  ),
  Subheading("...and even format text!"),
  Section(
    [
      Text("This is some text. "),
      Bold("This is bold. "),
      Text("This text has some "),
      Code("code"),
      Text(" in it."),
    ],
  ),
]
