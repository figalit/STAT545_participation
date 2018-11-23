all: report.html

clean:
	rm -f words.txt histogram.tsv histogram.png report.md report.html

words.txt: /usr/share/dict/words
	cp /usr/share/dict/words words.txt

histogram.tsv: histogram.r words.txt
	Rscript $<

histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("$<")); ggsave("$@")'
	rm Rplots.pdf

report.html: report.rmd histogram.tsv histogram.png
	Rscript -e 'rmarkdown::render("$<")'