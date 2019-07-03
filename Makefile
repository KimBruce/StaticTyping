MINIGRACE=../gracelang/minigrace

# TODO Recompile only when files are changed
install:
	rm -f ScopeModule.js 
	rm -f ObjectTypeModule.js 
	rm -f SharedTypes.js 
	rm -f StaticTyping.js
	mgc ScopeModule.grace
	mgc SharedTypes.grace
	mgc ObjectTypeModule.grace
	mgc StaticTyping.grace

test:
	tests/harness-js $(MINIGRACE)/j2/minigrace-js tests "" $(TESTS)