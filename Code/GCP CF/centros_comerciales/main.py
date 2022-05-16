import pandas as pd
import pymysql
from sqlalchemy import create_engine
from google.cloud import storage

storage_client = storage.Client()
sqlEngine = create_engine('mysql+pymysql://cosmefulanito:qwerty12345@34.122.170.218:3306/final_rdbs', pool_recycle=3600)
dbConnection = sqlEngine.connect()


def hello_gcs(event, context):

    df = pd.read_csv(f"gs://{event['bucket']}/{event['name']}", encoding='utf-8')
    df.rename(columns ={'ID':'id','TIPO':'tipo','INSTITUCIO':'institucion','CALLE':'calle','NUMERO':'numero','REFERENCIA':'referencia','COLONIA':'colonia','C_P_': 'codigo_postal','Observacio':'observacion','Alcaldía':'alcaldia','geometry':'geometry'},inplace=True)

    alcaldias = {
    'Álvaro Obregón':'ALVARO OBREGON', 
    'Magdalena Contreras': 'MAGDALENA CONTRERAS', 
    'Xochimilco': 'XOCHIMILCO',
    'Milpa Alta':'MILPA ALTA', 
    'Tlahuac':'TLAHUAC', 
    'Benito Juárez':'BENITO JUAREZ', 
    'Miguel Hidalgo':'MIGUEL HIDALGO',
    'Azcapotzalco':'AZCAPOTZALCO', 
    'Gustavo A. Madero':'GUSTAVO A. MADERO', 
    'Cuajimalpa':'CUAJIMALPA', 
    'Iztacalco':'IZTACALCO',
    'Cuauhtémoc':'CUAUHTEMOC', 
    'Venustiano Carranza':'VENUSTIANO CARRANZA', 
    'Tlalpan':'TLALPAN', 
    'Coyoacán':'COYOACAN',
    'Iztapalapa':'IZTAPALAPA'
    }

    df.drop(['id','institucion','referencia','observacion','geometry'], inplace=True, axis=1)
    df['alcaldia'] = df['alcaldia'].apply(lambda x:alcaldias[x])
    df['calle'] = df['calle'].apply(lambda x: str(x).upper())
    df['colonia'] = df['colonia'].apply(lambda x: str(x).upper())
    df['codigo_postal'] = df['codigo_postal'].apply(lambda x: str(x).split('.')[0])

    
    print (df.head())
    df.to_sql("centros_comerciales", con=dbConnection, if_exists='replace', index = False)
    dbConnection.close()