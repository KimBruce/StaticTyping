.DEFAULT_GOAL := compile

MINIGRACE = ../gracelang/minigrace
SRC = $(wildcard *.grace)

%.js: %.grace
	mgc $<

compile: $(patsubst %.grace, %.js, $(SRC))

test:
	tests/harness-js $(MINIGRACE)/j2/minigrace-js tests "" $(TESTS)

clean:
	rm  *.js