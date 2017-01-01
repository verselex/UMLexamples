all: pngs encoded

pngs: usecase_0a service_0a system_0a

encoded: encoded_usecase_0a encoded_service_0a encoded_system_0a

usecase_0a:
	cat use_case_0a.uml | java -jar plantuml.jar -pipe > usecase_0a.png

encoded_usecase_0a:
	@java -jar plantuml.jar -encodeurl use_case_0a.uml > /tmp/url.txt
	@export URL="http://plantuml.com/plantuml/uml/"`cat /tmp/url.txt`; echo $${URL} > usecase_0a.url
	@cat usecase_0a.url

service_0a:
	java -jar plantuml.jar -DSHOW_SERVICES=1 use_case_0a.uml
	mv use_case_0a.png service_0a.png

encoded_service_0a:
	@java -jar plantuml.jar -encodeurl -DSHOW_SERVICES=1 use_case_0a.uml > /tmp/url.txt
	@export URL="http://plantuml.com/plantuml/uml/"`cat /tmp/url.txt`; echo $${URL} > service_0a.url
	@cat service_0a.url

system_0a:
	java -jar plantuml.jar -DSHOW_SYSTEM=1 use_case_0a.uml
	mv use_case_0a.png system_0a.png

encoded_system_0a:
	@java -jar plantuml.jar -encodeurl -DSHOW_SYSTEM=1 use_case_0a.uml > /tmp/url.txt
	@export URL="http://plantuml.com/plantuml/uml/"`cat /tmp/url.txt`; echo $${URL} > system_0a.url
	@cat system_0a.url

clean:
	rm -f *~ *.png *.url
