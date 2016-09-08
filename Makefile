deploy-default:
	cp ./build/libs/* /home/vagrant/release/default
	cd /home/vagrant/release/default
	java -jar ./play_with_pipes-1.0-SNAPSHOT.jar > app.log &