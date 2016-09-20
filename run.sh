#!/bin/bash

mkdir -p ${CERTIFICATE_FOLDER}

echo  "basicConstraints=critical,CA:true,pathlen:0" > extensions.ini

if [ ! -z ${SUBJ_ALT_NAME} ]; then
  echo "subjectAltName=${SUBJ_ALT_NAME}" >> extensions.ini
fi

echo "Generating key ..."
/usr/bin/openssl genrsa -out ${CERTIFICATE_FOLDER}/${KEY_NAME}.key ${KEY_SIZE}
echo "Generating certificate request ..."
/usr/bin/openssl req -new -subj "/C=/ST=/L=/O=/CN=${COMMON_NAME}" -key ${CERTIFICATE_FOLDER}/${KEY_NAME}.key -out ${CERTIFICATE_FOLDER}/${KEY_NAME}.csr
echo "Generating certificate ..."
/usr/bin/openssl x509 -req -signkey ${CERTIFICATE_FOLDER}/${KEY_NAME}.key -days ${DAYS} -in ${CERTIFICATE_FOLDER}/${KEY_NAME}.csr -out ${CERTIFICATE_FOLDER}/${KEY_NAME}.crt -extfile extensions.ini

rm extensions.ini
