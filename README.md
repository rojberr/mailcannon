# mailcannon

Send enormous amount of mails using swaks SMTP container. 
Spawn an army of containers, and scale it up. You can easily send >36,000 emails per hour.

![Google banned 3rd-party smtp use](img/mail-cannon-thumb.jpg)

## Usage 💡

1) [Install Docker](https://docs.docker.com/get-docker/) on your system

2) Change the values in `.env` file, and use your container #, desired port, ip, subject ...

2) Now you can deploy many containers using docker-compose (adjust the number of containers to your needs):
    ```bash
    docker-compose up
    ```
3) To count the total number of mails you can install and use mail smtp-sink: 
    ```bash
   sudo smtp-sink -u root -c 127.0.0.1:2555 255
    ```