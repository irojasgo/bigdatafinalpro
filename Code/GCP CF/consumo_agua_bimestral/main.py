import pandas as pd
import pymysql
from sqlalchemy import create_engine
from google.cloud import storage

storage_client = storage.Client()
sqlEngine = create_engine('mysql+pymysql://cosmefulanito:qwerty12345@34.122.170.218:3306/final_rdbs', pool_recycle=3600)
dbConnection = sqlEngine.connect()


def hello_gcs(event, context):

    df = pd.read_csv(f"gs://{event['bucket']}/{event['name']}", encoding='utf-8')
    df.rename(columns ={'ID':'id','TIPO':'tipo','INSTITUCIO':'institucion','CALLE':'calle','OBJECTID':'objectid','FREQUENCY':'frequency','SUM_cons_t':'sum_cons_t','MEAN_cons_': 'mean_cons','VIV2010':'viv2010','PROMVIVCON':'promvivcon','C_PROMVIVC':'c_promvivc'},inplace=True)
    df = df[~df['alcaldia'].isnull()]
    df.drop(['geometry'], inplace=True, axis=1)
    
    print (df.head())
    df.to_sql("consumo_agua_bimestral", con=dbConnection, if_exists='replace', index = False)
    dbConnection.close()