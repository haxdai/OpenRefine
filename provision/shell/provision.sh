dpkg -s python-software-properties > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
	echo "Installing Software Properties Package..." \
	&& apt-get update > /dev/null 2>&1 \
	&& apt-get install -y python-software-properties
fi

dpkg -s python-software-properties > /dev/null 2>&1
if [ $? -eq 0 ]; then
	dpkg -s oracle-java7-installer > /dev/null 2>&1
	if [ ! $? -eq 0 ]; then
		echo "Installing Oracle JDK..." \
		&& add-apt-repository ppa:webupd8team/java > /dev/null 2>&1 \
		&& apt-get update > /dev/null 2>&1 \
		&& echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections \
		&& echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections \
		&& apt-get install -y oracle-java7-installer > /dev/null 2>&1
	fi
fi

dpkg -s oracle-java7-installer > /dev/null 2>&1
if [ $? -eq 0 ]; then
	echo "Building OpenRefine..." \
	&& cd /opt/OpenRefine \
	&& ./refine build
fi