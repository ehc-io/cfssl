FROM cfssl/cfssl:latest

# RUN cfssl print-defaults config  && cfssl print-defaults csr 

EXPOSE 8888

RUN mkdir /root/certs

COPY certs/root_ca_cert.pem /root/certs/root_ca_cert.pem
COPY certs/root_ca_key.pem /root/certs/root_ca_key.pem
#
ENTRYPOINT ["cfssl"]
#
CMD ["serve","-ca=/root/certs/root_ca_cert.pem","-ca-key=/root/certs/root_ca_key.pem","-address=0.0.0.0"] 
