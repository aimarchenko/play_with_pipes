deploy-default:
	mkdir /home/vagrant/release
	mkdir /home/vagrant/release/default
	rm /home/vagrant/release/default
	cp ./build/libs /home/vagrant/release/default
	java -jar /home/vagrant/release/default/play_with_pipes-1.0-SNAPSHOT.jar > app.log &