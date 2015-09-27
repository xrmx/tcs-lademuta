
MARKDOWN=\
    django.md \

ODPDOWN?=~/src/odpdown/venv/bin/odpdown

.PHONY: default
default: $(patsubst %.md,%.odp,$(MARKDOWN))

.PHONY: clean
clean:
	rm $(patsubst %.md,%.pdf,$(MARKDOWN)) $(patsubst %.md,%.odp,$(MARKDOWN))

# -s emacs
%.odp : %.md base.odp Makefile
	$(ODPDOWN) --break-master=PrimaSlide --content-master=Predefinito $< base.odp $@

%.pdf : %.odp
	rm -f $@
	soffice --headless --convert-to pdf:impress_pdf_Export $<

