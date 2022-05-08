FROM debian:buster

RUN apt-get update
RUN apt-get install -y curl

#downlond the cadvisor binary 
RUN curl -L https://github.com/google/cadvisor/releases/download/v0.37.5/cadvisor -o /usr/bin/cadvisor --silent
RUN chmod +x /usr/bin/cadvisor

#start cadvisor binary 
CMD ["/usr/bin/cadvisor", "-logtostderr", "--port=8081"]
