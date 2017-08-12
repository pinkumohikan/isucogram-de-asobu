bench:
	cd /home/h-shinoda/isucogram/benchmarker && ./bin/benchmarker -t "localhost:80" -u userdata

kataribe:
	git clone https://github.com/matsuu/kataribe.git
	cd kataribe
	go get github.com/BurntSushi/toml
	go build -o kataribe main.go

ka:
	sudo cat /var/log/nginx/access.log | ./kataribe/kataribe -f kataribe/kataribe.toml

clean:
	sudo systemctl stop nginx
	sudo rm -rf /var/log/nginx/*
	sudo systemctl start nginx
	sudo systemctl stop mysql
	sudo rm -rf /var/lib/mysql/mysql-slow.log
	sudo systemctl start mysql

mysqldumpslow:
	sudo mysqldumpslow -s c /var/lib/mysql/mysql-slow.log
