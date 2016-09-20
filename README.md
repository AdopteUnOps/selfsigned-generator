# selfsigned-generator

Debian based image with openssl for ssl certificate generation.

 Usage `docker run --rm  -e COMMON_NAME=<Common Name> -v /certs:/certs adopteunops/selfsigned-generator`
 Usage with subject alt name `docker run --rm -e COMMON_NAME=<Common Name> -e SUBJ_ALT_NAME=<Subject Alt Name> -v /certs:/certs adopteunops/selfsigned-generator`


 Exemple:
 `docker run --rm -e COMMON_NAME="mydomain.com" -e SUBJ_ALT_NAME="DNS:*.mydomain.com" -v $(pwd):/certs adopteunops/selfsigned-generator`
