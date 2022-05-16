import pandas as pd
import pymysql
from sqlalchemy import create_engine
from google.cloud import storage

storage_client = storage.Client()
sqlEngine = create_engine('mysql+pymysql://cosmefulanito:qwerty12345@34.122.170.218:3306/final_rdbs', pool_recycle=3600)
dbConnection = sqlEngine.connect()

def hello_gcs(event, context):

  df = pd.read_csv(f"gs://{event['bucket']}/{event['name']}", encoding='utf-8')


  df.drop(['FID_1','ue_comerc','geometry'], inplace=True, axis=1)
  alcaldias = {
    'ALVARO OBREGON':'ALVARO OBREGON', 
    'LA MAGDALENA CONTRERAS': 'MAGDALENA CONTRERAS', 
    'XOCHIMILCO': 'XOCHIMILCO',
    'MILPA ALTA':'MILPA ALTA', 
    'TLAHUAC':'TLAHUAC', 
    'BENITO JUAREZ':'BENITO JUAREZ', 
    'MIGUEL HIDALGO':'MIGUEL HIDALGO',
    'AZCAPOTZALCO':'AZCAPOTZALCO', 
    'GUSTAVO A. MADERO':'GUSTAVO A. MADERO', 
    'CUAJIMALPA DE MORELOS':'CUAJIMALPA', 
    'IZTACALCO':'IZTACALCO',
    'CUAUHTEMOC':'CUAUHTEMOC', 
    'VENUSTIANO CARRANZA':'VENUSTIANO CARRANZA', 
    'TLALPAN':'TLALPAN', 
    'COYOACAN':'COYOACAN',
    'IZTAPALAPA':'IZTAPALAPA'
    }
  df['alcaldia'] = df['alcaldia'].apply(lambda x:alcaldias[x])

  print (df.head())
  df.to_sql("ue_comerciales", con=dbConnection, if_exists='replace', index = False)
  dbConnection.close()