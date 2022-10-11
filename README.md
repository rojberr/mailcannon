# mailcannon

Send enormous amount of mails using swaks SMTP container. 
Spawn an army of containers, and scale it up. You can easily send >25,000 emails per hour.

![Google banned 3rd-party smtp use](img/mail-cannon-thumb.jpg)

## Usage 💡

1) [Install Docker](https://docs.docker.com/get-docker/) on your system

2) Now you can:
   - deploy many containers using docker-compose (adjust the number of containers to your needs):
    ```bash
    NUMBER_OF_CONTAINERS=10 docker-compose up
    ```