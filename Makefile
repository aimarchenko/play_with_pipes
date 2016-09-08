deploy-default:
	cp ./build/libs/* /home/vagrant/release/docker
	cd /home/vagrant/release/docker
	java -jar ./play_with_pipes-1.0-SNAPSHOT.jar > app.log &

deploy-docker:
	sudo docker run -p 9080:9080 --name play_with_pipes play_with_pipes:latest