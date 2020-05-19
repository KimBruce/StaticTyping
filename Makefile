.DEFAULT_GOAL := compile

MINIGRACE=../gracelang/minigrace

%.js: %.grace
	mgc $<

SharedTypes.js: SharedTypes.grace
	mgc SharedTypes.grace

ScopeModule.js: SharedTypes.js ScopeModule.grace
	mgc ScopeModule.grace

ObjectTypeModule.js: SharedTypes.js ScopeModule.js ObjectTypeModule.grace
	mgc ObjectTypeModule.grace

StaticTyping.js: SharedTypes.js ScopeModule.js ObjectTypeModule.js StaticTyping.grace
	mgc StaticTyping.grace

compile: $(patsubst %, %.js, SharedTypes ScopeModule ObjectTypeModule StaticTyping)

intro: compile intro.grace
	mgc intro.grace

ide: compile intro
	mkdir -p ide
	cp {SharedTypes.js,ScopeModule.js,ObjectTypeModule.js,StaticTyping.js,intro.js} ide/
	rsync -rtz --chmod=Fa+rX ide/ $(WEB_SERVER):$(WEB_DIRECTORY)/js
	rm -rf ide

test:
	rm -f tests/*.js
	tests/harness-js $(MINIGRACE)/j2/minigrace-js tests "" $(TESTS)

clean:
	rm  -f *.js
