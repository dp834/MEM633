MATHEMATICA_FILES := $(wildcard *.wls)
RUN_MATHEMATICA_WHEN_NEEDED := $(addprefix .mod_,$(MATHEMATICA_FILES))

MATLAB_FILES := $(wildcard *.m)
RUN_MATLAB_WHEN_NEEDED := $(addprefix .mod_,$(MATLAB_FILES))

MATLAB_MAIN  = Homework_6.m

IMG_OUTPUT = images/

LATEX_SRC  = Homework-6.tex
PDF_OUTPUT = Homework-6

.PHONY: all
all: pdf

run: $(RUN_MATLAB_WHEN_NEEDED)

$(RUN_MATLAB_WHEN_NEEDED): .mod_% : %
	@mkdir -p $(IMG_OUTPUT)
	@echo "Running $^"
	@matlab -nodisplay -nosplash -batch "run('$^')"
	@touch $@

math: $(RUN_MATHEMATICA_WHEN_NEEDED)

$(RUN_MATHEMATICA_WHEN_NEEDED): .mod_% : %
	@mkdir -p $(IMG_OUTPUT)
	@echo "Running $^"
	@math -noprompt -run "<<$^; Exit[]"
	@touch $@

pdf: $(LATEX_SRC) $(RUN_MATHEMATICA_WHEN_NEEDED)
	@echo "Creating pdf"
	@pdflatex -jobname $(PDF_OUTPUT) $(LATEX_SRC)

clean:
	@rm -rf .mod_* $(IMG_OUTPUT)/* $(PDF_OUTPUT).pdf *.aux *.log *.nav *.toc *.snm *.out &2> /dev/null || true
