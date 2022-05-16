#!/bin/bash
hdfs dfs -rm /user/irojasgo/centros_comerciales/*
hdfs dfs -rm /user/irojasgo/consumo_agua_bimestral/*
hdfs dfs -rm /user/irojasgo/hogares_por_colonia/*
hdfs dfs -rm /user/irojasgo/poblacion_disponibilidad_agua_vivienda/*
hdfs dfs -rm /user/irojasgo/poblacion_total/*
hdfs dfs -rm /user/irojasgo/ue_comerciales/*
hdfs dfs -rm /user/irojasgo/ue_industriales/*
hdfs dfs -rm /user/irojasgo/ue_orientadas_servicios/*
hdfs dfs -rm /user/irojasgo/ue_por_colonia/*
hdfs dfs -rm /user/irojasgo/viviendas_sin_drenaje/*

hdfs dfs -rmdir /user/irojasgo/centros_comerciales/
hdfs dfs -rmdir /user/irojasgo/consumo_agua_bimestral/
hdfs dfs -rmdir /user/irojasgo/hogares_por_colonia/
hdfs dfs -rmdir /user/irojasgo/poblacion_disponibilidad_agua_vivienda/
hdfs dfs -rmdir /user/irojasgo/poblacion_total/
hdfs dfs -rmdir /user/irojasgo/ue_comerciales/
hdfs dfs -rmdir /user/irojasgo/ue_industriales/
hdfs dfs -rmdir /user/irojasgo/ue_orientadas_servicios/
hdfs dfs -rmdir /user/irojasgo/ue_por_colonia/
hdfs dfs -rmdir /user/irojasgo/viviendas_sin_drenaje/
