#!/bin/sh

# TODO: Sanity checks need to be added:
#  Is this a Linux box?
#  Am I root?
#  Did each file download correctly?
#  Did each file save correctly?
#  This should be converted to a loop that is portable across multiple shells

CAPATH='/etc/ssl/certs'

echo -n "Installing Barbican Root certificate... "
CAFILE='rs_ca_level1.crt'
curl -so ${CAPATH}/${CAFILE} https://ssltool.rackspace.com/rscerts/${CAFILE}
HASH=`openssl x509 -subject_hash -noout -in $CAPATH/$CAFILE`
ln -sf ${CAPATH}/${CAFILE} ${CAPATH}/${HASH}.0
echo "Done."

echo -n "Installing ORD1 Intermediate certificate... "
CAFILE='ord1_rs_ca_01.crt'
curl -so ${CAPATH}/${CAFILE} https://ssltool.rackspace.com/rscerts/${CAFILE}
HASH=`openssl x509 -subject_hash -noout -in $CAPATH/$CAFILE`
ln -sf ${CAPATH}/${CAFILE} ${CAPATH}/${HASH}.0
echo "Done."

echo -n "Installing LON3 Intermediate certificate... "
CAFILE='lon3_rs_ca_01.crt'
curl -so ${CAPATH}/${CAFILE} https://ssltool.rackspace.com/rscerts/${CAFILE}
HASH=`openssl x509 -subject_hash -noout -in $CAPATH/$CAFILE`
ln -sf ${CAPATH}/${CAFILE} ${CAPATH}/${HASH}.0
echo "Done."

echo -n "Installing previous Rackspace internal CA... "
CAFILE='rs_internal_ca.crt'
curl -so ${CAPATH}/${CAFILE} https://ssltool.rackspace.com/rscerts/${CAFILE}
HASH=`openssl x509 -subject_hash -noout -in $CAPATH/$CAFILE`
ln -sf ${CAPATH}/${CAFILE} ${CAPATH}/${HASH}.0
echo "Done."
