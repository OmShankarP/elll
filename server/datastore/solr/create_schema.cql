DROP KEYSPACE elll;

CREATE KEYSPACE elll WITH REPLICATION = { 'class': 'NetworkTopologyStrategy', 'Solr': 1} AND durable_writes = true;

USE elll;

CREATE TYPE emergencycontact (mobile varchar);

CREATE TYPE history (latlong varchar, timestamp timestamp);

CREATE TYPE acceptorrejector (mobile varchar, timestamp timestamp);

CREATE TYPE sos (requestid varchar, timestamp timestamp, latlong varchar, status varchar, acceptors list<FROZEN<acceptorrejector>>, rejectors list<FROZEN<acceptorrejector>>);

CREATE TABLE user (mobile varchar PRIMARY KEY, name varchar, email varchar, latlong varchar, emergencycontacts list<FROZEN<emergencycontact>>, history FROZEN<history>, sos FROZEN<sos>);

