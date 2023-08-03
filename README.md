# FilamentPHP 3 Documentation — Book Formats

**Note: This is not an official FilamentPHP project and could be outdated. The complete, official, FilamentPHP documentation is available at <https://filamentphp.com/docs>.**

## About
This repository includes a single-page HTML and an ePub formatted version of the [FilamentPHP documentation](https://filamentphp.com/docs), along with the scripts and files used for the build process.

You might be thinking ... "why the **** would you do this?" 😆. I wanted to read the FilamentPHP documentation on my computer and phone while traveling — without an Internet connection. I'm sharing it here for the *very* small chance that someone else finds it useful.

I'll try to update the books periodically, but please refer to the official [FilamentPHP documentation](https://filamentphp.com/docs) when developing your application.

## What pages from the FilamentPHP docs are included in the books?
I included the following packages (excluding the installation pages):
- Panels
- Tables
- Forms
- Actions
- Infolists
- Widgets
- Notifications

> The screenshots are also missing from the books, since they are not in the Markdown directly and added via Astro to the live docs.

## How did you build the books?
I used [Pandoc](https://pandoc.org/) with a custom shell script (and some messy hacks 😂). Since the FilamentPHP documentation is written in Markdown, it was a relatively simple process:

1. Clone the [FilamentPHP v3 repository](https://github.com/filamentphp/filament).
2. I couldn't find an easy way to enforce a specific section order, so I ordered them manually in `merge_order.txt`. (I used `ls *.md | pbcopy` from each package `/docs/` folder to populate the file names.)
> Note: The extra files at the start of each section contain are one-line files for the section titles — used to build the table of contents. For example, `Panels.md` contains only `# Panels`.
3. Since the page titles in the FilamentPHP docs are in the frontmatter (not directly in the Markdown as an h1), I duplicated the `merge_order.txt` file as `titles.txt` and edited for some reasonable section titles.
> Note: There are some duplication issues with the titles due to the way the script merges the titles into the documents, but I didn't want to spend too much time on this. If you know an easy solution, let me know.
4. Put all the supporting files and scripts in the `packages` directory of the local FilamentPHP repository and run `./build_book.sh` and `./build_html.sh` to generate the ePub and HTML versions of the books.

## Why no PDF?
Although Pandoc supports PDF output via LaTeX, there were errors during the build process.
```bash
Error producing PDF.
! Undefined control sequence.
```
If you know an easy solution, let me know.

## Have some suggestions to improve the process?
You can reach me on Twitter at [@richeklein](https://twitter.com/richeklein).
