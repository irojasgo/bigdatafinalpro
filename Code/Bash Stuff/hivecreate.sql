CREATE EXTERNAL TABLE centros_comerciales
(
tipo VARCHAR(100), 
calle VARCHAR(100), 
numero VARCHAR(100),
colonia VARCHAR(100),
codigo_postal VARCHAR(100),  
alcaldia VARCHAR(100)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
location '/user/irojasgo/centros_comerciales_hive'
;

CREATE EXTERNAL TABLE consumo_agua_bimestral
(
cve_ent VARCHAR(100), 
alcaldia VARCHAR(100), 
cve_col VARCHAR(100),
colonia VARCHAR(100), 
objectid VARCHAR(100),
frequency VARCHAR(100), 
sum_cons_t VARCHAR(100),
mean_cons VARCHAR(100),
viv2010 VARCHAR(100),
promvivcon VARCHAR(100), 
c_promvivc VARCHAR(100)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
location '/user/irojasgo/consumo_agua_bimestral_hive'
;

CREATE EXTERNAL TABLE hogares_por_colonia
(
cve_ent VARCHAR(100), 
alcaldia VARCHAR(100),
cve_col VARCHAR(100),
colonia VARCHAR(100), 
vivhab2010 VARCHAR(100), 
vivhab2020 VARCHAR(100),
area_ha VARCHAR(100), 
denviv10 VARCHAR(100),
denviv20 VARCHAR(100),
sum_tothog VARCHAR(100)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
location '/user/irojasgo/hogares_por_colonia_hive'
;

CREATE EXTERNAL TABLE poblacion_disponibilidad_agua_vivienda
(
alcaldia VARCHAR(100),
clave VARCHAR(100),
poblacion VARCHAR(100), 
poblacion_agua_patio VARCHAR(100), 
porcentaje_poblacion_agua_patio VARCHAR(100),
poblacion_no_agua_entubada VARCHAR(100), 
porcentaje_poblacion_no_agua_entubada VARCHAR(100),
poblacion_agua_pipa VARCHAR(100),
porcentaje_poblacion_agua_pipa VARCHAR(100)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
location '/user/irojasgo/poblacion_disponibilidad_agua_vivienda_hive'
;

CREATE EXTERNAL TABLE poblacion_total
(
anio VARCHAR(100),
alcaldia VARCHAR(100),
poblacion_total VARCHAR(100)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
location '/user/irojasgo/poblacion_total_hive'
;

CREATE EXTERNAL TABLE ue_comerciales
(
nombre VARCHAR(100),
entidad VARCHAR(100),
cve_alc VARCHAR(100),
alcaldia VARCHAR(100),
cve_col VARCHAR(100),
ue VARCHAR(100),
ind VARCHAR(100),
com VARCHAR(100),
sup_ha VARCHAR(100)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
location '/user/irojasgo/ue_comerciales_hive'
;

CREATE EXTERNAL TABLE ue_industriales
(
nombre VARCHAR(100),
entidad VARCHAR(100),
cve_alc VARCHAR(100),
alcaldia VARCHAR(100),
cve_col VARCHAR(100),
ue VARCHAR(100),
ind VARCHAR(100),
com VARCHAR(100),
sup_ha VARCHAR(100)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
location '/user/irojasgo/ue_industriales_hive'
;

CREATE EXTERNAL TABLE ue_orientadas_servicios
(
nombre VARCHAR(100),
entidad VARCHAR(100),
cve_alc VARCHAR(100),
alcaldia VARCHAR(100),
cve_col VARCHAR(100),
ue VARCHAR(100),
ind VARCHAR(100),
com VARCHAR(100),
sup_ha VARCHAR(100)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
location '/user/irojasgo/ue_orientadas_servicios_hive'
;

CREATE EXTERNAL TABLE ue_por_colonia
(
nombre VARCHAR(100),
entidad VARCHAR(100),
cve_alc VARCHAR(100),
alcaldia VARCHAR(100),
cve_col VARCHAR(100),
ue VARCHAR(100),
ind VARCHAR(100),
com VARCHAR(100),
serv VARCHAR(100),
sup_ha VARCHAR(100)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
location '/user/irojasgo/ue_por_colonia_hive'
;


CREATE EXTERNAL TABLE viviendas_sin_drenaje
(
cve_ent VARCHAR(100),alcaldia VARCHAR(100),cve_col VARCHAR(100),colonia VARCHAR(100),pob_2010 VARCHAR(100),
sup_col_m2 VARCHAR(100),pob_2020 VARCHAR(100),vivtot VARCHAR(100),tvivhab VARCHAR(100),tvivpar VARCHAR(100),
vivpar_hab VARCHAR(100),tvivparhab VARCHAR(100),vivpar_des VARCHAR(100),vivpar_ut VARCHAR(100),ocupvivpar VARCHAR(100),
prom_ocup VARCHAR(100),pro_ocup_c VARCHAR(100),vph_pisodt VARCHAR(100),vph_pisoti VARCHAR(100),vph_1dor VARCHAR(100),
vph_2ymasd VARCHAR(100),vph_1cuart VARCHAR(100),vph_2cuart VARCHAR(100),vph_3ymasc VARCHAR(100),vph_c_elec VARCHAR(100),
vph_s_elec VARCHAR(100),vph_aguadv VARCHAR(100),vph_aeasp VARCHAR(100),vph_aguafv VARCHAR(100),vph_tinaco VARCHAR(100),
vph_cister VARCHAR(100),vph_excsa VARCHAR(100),vph_letr VARCHAR(100),vph_drenaj VARCHAR(100),vph_nodren VARCHAR(100),
vph_c_serv VARCHAR(100),vph_ndeaed VARCHAR(100),vph_dsadma VARCHAR(100),vph_ndacmm VARCHAR(100),vph_snbien VARCHAR(100),
vph_refri VARCHAR(100),vph_lavad VARCHAR(100),vph_hmicro VARCHAR(100),vph_autom VARCHAR(100),vph_moto VARCHAR(100),
vph_bici VARCHAR(100),vph_radio VARCHAR(100),vph_tv VARCHAR(100),vph_pc VARCHAR(100),vph_telef VARCHAR(100),
vph_cel VARCHAR(100),vph_inter VARCHAR(100),vph_stvp VARCHAR(100),vph_spmvpi VARCHAR(100),vph_cvj VARCHAR(100),
vph_sinrtv VARCHAR(100),vph_sinltc VARCHAR(100),vph_sincin VARCHAR(100),vph_sintic VARCHAR(100)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
location '/user/irojasgo/viviendas_sin_drenaje_hive'
;
