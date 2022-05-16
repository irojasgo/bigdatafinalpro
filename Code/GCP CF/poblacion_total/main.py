import pandas as pd
import pymysql
from sqlalchemy import create_engine
from google.cloud import storage


storage_client = storage.Client()
sqlEngine = create_engine('mysql+pymysql://cosmefulanito:qwerty12345@34.122.170.218:3306/final_rdbs', pool_recycle=3600)
dbConnection = sqlEngine.connect()

def hello_gcs(event, context):

  df = pd.read_csv(f"gs://{event['bucket']}/{event['name']}", encoding='utf-8')


  df.rename(columns ={'Año':'anio',
                    'Alcaldia':'alcaldia',
                    'Población total':'poblacion_total'
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
      'Iztapalapa':'IZTAPALAPA',
      'CDMX':'CDMX'
  }

  df['alcaldia'] = df['alcaldia'].apply(lambda x:alcaldias[x.rstrip()])
  df['poblacion_total'] = df['poblacion_total'].apply(lambda x: int(x.replace(',','')))

  print (df.head())
  df.to_sql("poblacion_total", con=dbConnection, if_exists='replace', index = False)
  dbConnection.close()