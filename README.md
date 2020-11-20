# docker-ssh-tunneling
A container merely for SSH tunneling

	mkdir ./opt
	ssh-keygen -f ./opt/ssh_host_rsa_key -N '' -t rsa
	ssh-keygen -f ./opt/id_rsa -N '' -t rsa
	cp ./opt/id_rsa.pub ./opt/authorized_keys
	
	docker-compose up -d
	
	ssh -i ./opt/id_rsa -L 8080:httpbin.org:80 -N -p 2222 tunneling@localhost
	curl -fsL http://localhost:8080/get