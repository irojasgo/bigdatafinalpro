import pandas as pd
import pymysql
from sqlalchemy import create_engine
from google.cloud import storage


storage_client = storage.Client()
sqlEngine = create_engine('mysql+pymysql://cosmefulanito:qwerty12345@34.122.170.218:3306/final_rdbs', pool_recycle=3600)
dbConnection = sqlEngine.connect()

def hello_gcs(event, context):

  df = pd.read_csv(f"gs://{event['bucket']}/{event['name']}", encoding='utf-8')


  df.rename(columns ={'Alcaldía':'alcaldia',
                    'Clave':'clave',
                    'Población':'poblacion',
                    'Ocupantes de viviendas particulares habitadas que disponen de agua entubada solo en el patio o terreno':'poblacion_agua_patio',
                    'Porcentaje':'porcentaje_poblacion_agua_patio',
                    'Ocupantes de viviendas particulares habitadas que no disponen de agua entubada':'poblacion_no_agua_entubada',
                    'Porcentaje.1':'porcentaje_poblacion_no_agua_entubada',
                    'Ocupantes de viviendas particulares habitadas que no  disponen de agua entubada pero le traen una pipa':'poblacion_agua_pipa',
                    'Porcentaje.2':'porcentaje_poblacion_agua_pipa'
                    },inplace=True)

  alcaldias = {
      'Álvaro Obregón':'ALVARO OBREGON', 
      'La Magdalena Contreras': 'MAGDALENA CONTRERAS', 
      'Xochimilco': 'XOCHIMILCO',
      'Milpa Alta':'MILPA ALTA', 
      'Tláhuac':'TLAHUAC', 
      'Benito Juárez':'BENITO JUAREZ', 
      'Miguel Hidalgo':'MIGUEL HIDALGO',
      'Azcapotzalco':'AZCAPOTZALCO', 
      'Gustavo A. Madero':'GUSTAVO A. MADERO', 
      'Cuajimalpa de Morelos':'CUAJIMALPA', 
      'Iztacalco':'IZTACALCO',
      'Cuauhtémoc':'CUAUHTEMOC', 
      'Venustiano Carranza':'VENUSTIANO CARRANZA', 
      'Tlalpan':'TLALPAN', 
      'Coyoacán':'COYOACAN',
      'Iztapalapa':'IZTAPALAPA'
  }

  df['alcaldia'] = df['alcaldia'].apply(lambda x:alcaldias[x.rstrip()])
  df['poblacion'] = df['poblacion'].apply(lambda x: int(x.replace(',','')))
  df['poblacion_agua_patio'] = df['poblacion_agua_patio'].apply(lambda x: int(x.replace(',','')))


  print (df.head())
  df.to_sql("poblacion_disponibilidad_agua_vivienda", con=dbConnection, if_exists='replace', index = False)
  dbConnection.close()