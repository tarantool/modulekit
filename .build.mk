OS=$(shell lsb_release -i -s|tr A-Z a-z)
DIST=$(shell lsb_release -c -s)
SOURCE_LIST=/etc/apt/sources.list.d/tarantool.list

$(SOURCE_LIST):
	curl https://packagecloud.io/gpg.key | sudo apt-key add -
	echo "deb http://packagecloud.io/tarantool/1_6/$(OS)/ $(DIST) main" | sudo tee $@

test: $(SOURCE_LIST)
	sudo apt-get update > /dev/null
	sudo apt-get -q -y install tarantool tarantool-dev
	cmake . -DCMAKE_BUILD_TYPE=RelWithDebInfo
	$(MAKE)
	prove -v ./test/modulekit.test.lua

.PHONY: test
