PREFIX = /usr

build:

install:
	install -m 0755 skype_extract_db.sh $(PREFIX)/bin/skype_extract_db
	install -m 0755 skype_mood.py $(PREFIX)/bin/skype_mood
