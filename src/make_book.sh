paste merge_order.txt titles.txt | while IFS=$'\t' read -r file title
do
    echo "# $title" | cat - "$file" >> temp.md
done
pandoc -s --toc temp.md -o filament3-book.epub -M title="FilamentPHP 3 Documentation" -M author="FilamentPHP Team"
rm temp.md