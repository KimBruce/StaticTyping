.DEFAULT_GOAL := compile

MINIGRACE = ../gracelang/minigrace

%.js: %.grace
	mgc $<

compile: $(patsubst %, %.js, ScopeModule ObjectTypeModule SharedTypes StaticTyping)

test:
	rm -f tests/*.js
	tests/harness-js $(MINIGRACE)/j2/minigrace-js tests "" $(TESTS)

clean:
	rm  -f *.js