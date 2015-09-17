
# name of the main latex file (do not include .tex)
MAIN = talk

# name of command to perform Latex (either pdflatex or latex)
LATEX = pdflatex

FIGEXT = .pdf
MAINEXT= .pdf
BUILDCOMMAND=rm -f $(MAIN).aux && $(LATEX) $(MAIN) && $(LATEX) $(MAIN)

# list of all source files
TEXSOURCES = $(wildcard *.tex)
FIGSOURCES = $(wildcard figs/*$(FIGEXT))
SOURCES    = $(TEXSOURCES) $(FIGSOURCES)

# define output (could be making .ps instead)
OUTPUT = $(MAIN)$(MAINEXT)

# prescription how to make output (your favorite commands to process latex)
# do latex twice to make sure that all cross-references are updated 
$(OUTPUT): $(SOURCES) Makefile
	$(BUILDCOMMAND)

# just so we can say "make all" without knowing the output name
all: $(OUTPUT)

# remove temporary files
.PHONY : clean
clean:
	rm -f *~ *.toc *.snm *.aux *.log *.blg *.dvi *.tmp *.out *.blg *.nav $(MAIN)$(MAINEXT) $(MAIN).ps make.stdout

# remove output file
rmout: 
	rm  $(OUTPUT)
