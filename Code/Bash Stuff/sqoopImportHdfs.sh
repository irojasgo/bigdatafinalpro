#!/bin/bash
sudo mv sqoop-1.4.6.bin__hadoop-2.0.4-alpha /usr/local/sqoop
export SQOOP_HOME=/usr/local/sqoop
export PATH=$PATH:$SQOOP_HOME/bin
source ~/.bashrc



hdfs dfs -rm /user/irojasgo/centros_comerciales_hive/*
hdfs dfs -rm /user/irojasgo/consumo_agua_bimestral_hive/*
hdfs dfs -rm /user/irojasgo/hogares_por_colonia_hive/*
hdfs dfs -rm /user/irojasgo/poblacion_disponibilidad_agua_vivienda_hive/*
hdfs dfs -rm /user/irojasgo/poblacion_total_hive/*
hdfs dfs -rm /user/irojasgo/ue_comerciales_hive/*
hdfs dfs -rm /user/irojasgo/ue_industriales_hive/*
hdfs dfs -rm /user/irojasgo/ue_orientadas_servicios_hive/*
hdfs dfs -rm /user/irojasgo/ue_por_colonia_hive/*
hdfs dfs -rm /user/irojasgo/viviendas_sin_drenaje_hive/*

hdfs dfs -rmdir /user/irojasgo/centros_comerciales_hive/
hdfs dfs -rmdir /user/irojasgo/consumo_agua_bimestral_hive/
hdfs dfs -rmdir /user/irojasgo/hogares_por_colonia_hive/
hdfs dfs -rmdir /user/irojasgo/poblacion_disponibilidad_agua_vivienda_hive/
hdfs dfs -rmdir /user/irojasgo/poblacion_total_hive/
hdfs dfs -rmdir /user/irojasgo/ue_comerciales_hive/
hdfs dfs -rmdir /user/irojasgo/ue_industriales_hive/
hdfs dfs -rmdir /user/irojasgo/ue_orientadas_servicios_hive/
hdfs dfs -rmdir /user/irojasgo/ue_por_colonia_hive/
hdfs dfs -rmdir /user/irojasgo/viviendas_sin_drenaje_hive/

sqoop import --connect jdbc:mysql://34.122.170.218:3306/final_rdbs --table centros_comerciales --username cosmefulanito --password qwerty12345 -m 1
sqoop import --connect jdbc:mysql://34.122.170.218:3306/final_rdbs --table consumo_agua_bimestral --username cosmefulanito --password qwerty12345 -m 1
sqoop import --connect jdbc:mysql://34.122.170.218:3306/final_rdbs --table hogares_por_colonia --username cosmefulanito --password qwerty12345 -m 1
sqoop import --connect jdbc:mysql://34.122.170.218:3306/final_rdbs --table poblacion_disponibilidad_agua_vivienda --username cosmefulanito --password qwerty12345 -m 1
sqoop import --connect jdbc:mysql://34.122.170.218:3306/final_rdbs --table poblacion_total --username cosmefulanito --password qwerty12345 -m 1
sqoop import --connect jdbc:mysql://34.122.170.218:3306/final_rdbs --table ue_comerciales --username cosmefulanito --password qwerty12345 -m 1
sqoop import --connect jdbc:mysql://34.122.170.218:3306/final_rdbs --table ue_industriales --username cosmefulanito --password qwerty12345 -m 1
sqoop import --connect jdbc:mysql://34.122.170.218:3306/final_rdbs --table ue_orientadas_servicios --username cosmefulanito --password qwerty12345 -m 1
sqoop import --connect jdbc:mysql://34.122.170.218:3306/final_rdbs --table ue_por_colonia --username cosmefulanito --password qwerty12345 -m 1
sqoop import --connect jdbc:mysql://34.122.170.218:3306/final_rdbs --table viviendas_sin_drenaje --username cosmefulanito --password qwerty12345 -m 1