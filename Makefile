env: requirements.txt
	virtualenv env
	source env/bin/activate; pip install --requirement=requirements.txt

test: env
	-pylint -E flask-assert
	source env/bin/activate; ./test/test.py -v

test3: env
	python3 ./test/test.py -v

release: docs
	python setup.py sdist upload -s -i D2069255

docs:
	$(MAKE) -C docs html

install:
	./setup.py install

.PHONY: test release docs
