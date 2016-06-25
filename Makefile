all: docset
	open starling.docset/

docset: ./doc.starling-framework.org
	./dashing build -f dashing.json -s doc.starling-framework.org starling | tee output.log

doc.starling-framework.org:
	wget -r http://doc.starling-framework.org/current/
	# Clean up the files we don't want dashing parsing
	rm doc.starling-framework.org/current/all-*
	rm doc.starling-framework.org/current/index.html?*

clean:
	rm -rf starling.docset doc.starling-framework.org output.log
