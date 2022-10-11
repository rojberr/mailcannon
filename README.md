# mailcannon

This is my solution to benchmark SMTP servers.

Send enormous amount of mails using SWAKS SMTP container.
Spawn an army of containers, and scale it up. You can easily send >36,000 emails per hour.

Mailcannon is a SMTP stress testing tool. It sends multiple emails repeatedly over all connections.

![Google banned 3rd-party smtp use](img/mail-cannon-thumb.jpg)

## Usage 💡

1) [Install Docker](https://docs.docker.com/get-docker/) on your system

2) Change the values in `.env` file, and use your container #, desired port, ip, subject ...

2) Now you can deploy many containers using docker-compose (adjust the number of containers to your needs):
```bash
docker-compose up -d
```

3) To count the total number of mails you can install and use mail smtp-sink:
```bash
sudo smtp-sink -u root -c 127.0.0.1:2555 255
```

## About 💁📙

This is my solution to benchmark SMTP servers. I started to work on this because I needed to know how my mail server
and middleware nodes will behave under high load. This solution is a way to find out how much user capacity your
system can handle during load testing.

Mailcannon uses Docker containers with SWAKS command to simulate high load.
This simple allows to establish >40_000 simultaneous SMTP connections on a typical laptop,
that can be easily scaled up using simple or more advanced orchestration tools (Docker
compose, Swarm, Kubernetes), and are limited only by the OS and hardware.

In order to simulate even higher load levels, mailcannon can run on multiple test client machines.

Mailcannon understands only SMTP protocol. No authentication mechanism is supported at the moment.

Mailcannon may be used to stress test normal SMTP servers, SMTP gateways, to test Anti-Virus and Anti-Spam softwares
that accept or filter SMTP connections and the like.

Using Mailcannon you can specify a list of the following:

- TO address,
- FROM address,
- SUBJECT of the message,
- ATTACHMENT content files.

By default Mailcannon uses environmental variables from `.env` file:

- NUMBER_OF_CONTAINERS - Number of containers that docker-compose will launch,
- RECIPIENT_IP - Specify the SMTP Mail Server's IP here. Example: "127.0.0.1",
- RECIPIENT_PORT - Specify the SMTP Mail Server's port number here. This is typically 25,
  ...

## TODO 📝

- Include randomness. Include a file, from which a random variable will be taken and sent away.
- Scale containers in steps, log the container number. By doing so we can know the exact number of virtual users
  when a bottleneck is discovered. THis is difficult to discover in a linear fashion. (number of threads/containers
  / linear ramp-up period, duration)
- Include visualisation.

## Author 👷

If You have better stats, drop me a line at: rojberr@outlook.com