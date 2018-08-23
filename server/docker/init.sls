docker pre-requisites:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - ca-certificates
      - curl
      - gnupg2
      - software-properties-common
  cmd.run:
    - unless:
      - which docker
    - names:
      - "curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -"
      - add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
      - apt-get update

docker:
  pkg.installed:
    - pkgs:
      - docker-ce
