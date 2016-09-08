deploy-default:
	cp ./build/libs/* /home/vagrant/release/default
	cd /home/vagrant/release/default
	java -jar ./play_with_pipes-1.0-SNAPSHOT.jar > app.log &

deploy-docker:
	cd /home/vagrant/release/docker
	sudo docker run -p 9080:9080 --name play_with_pipes play_with_pipes:latest > docker.log &