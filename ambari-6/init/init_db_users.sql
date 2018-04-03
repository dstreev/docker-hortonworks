CREATE USER 'ambari' IDENTIFIED BY 'hortonworks';
GRANT ALL PRIVILEGES ON *.* TO 'ambari';

CREATE USER 'hive' IDENTIFIED BY 'hortonworks';
GRANT ALL PRIVILEGES ON *.* TO 'hive';

CREATE USER 'oozie' IDENTIFIED BY 'hortonworks';
GRANT ALL PRIVILEGES ON *.* TO 'oozie';

CREATE USER 'ranger' IDENTIFIED BY 'hortonworks';
GRANT ALL PRIVILEGES ON *.* TO 'ranger';

CREATE USER 'ranger_kms' IDENTIFIED BY 'hortonworks';
GRANT ALL PRIVILEGES ON *.* TO 'ranger_kms';

CREATE USER 'druid' IDENTIFIED BY 'hortonworks';
GRANT ALL PRIVILEGES ON *.* TO 'druid';

CREATE USER 'superset' IDENTIFIED BY 'hortonworks';
GRANT ALL PRIVILEGES ON *.* TO 'superset';

CREATE USER 'registry' IDENTIFIED BY 'hortonworks';
GRANT ALL PRIVILEGES ON *.* TO 'registry';

CREATE USER 'streamline' IDENTIFIED BY 'hortonworks';
GRANT ALL PRIVILEGES ON *.* TO 'streamline';

FLUSH PRIVILEGES;
