import streamlit as st
import numpy as np
import pandas as pd
import pickle


# load the pickle

df = pd.read_pickle("df.pkl")

pipe = pickle.load(open('pipe.pkl', 'rb'))

# Website title
st.title("Laptop Price Predictor App")

# Brand
company = st.selectbox(label='Laptop Brand', options=df['Company'].unique())

#Type

type = st.selectbox(label='type', options=df['TypeName'].unique())

# Ram
ram = st.selectbox(label='Ram', options=df['Ram'].unique())

#Weight
weight= st.number_input(label='weight')

#TouchScreen
touchscreen = st.selectbox(label='TouchSreen', options=['Yes', 'No'])
                           
# IPS
ips = st.selectbox(label='IPS', options=['Yes', 'No'])
 
 # screensize
screensize= st.number_input(label='screensize')

# Resolution
resolution = st.selectbox(label="ScreenResolution", options=['1920x1000','1366x768', '1600x900', '3840x2160', '3200x1800', '2800x1800', '2560x1600', '2560x1440', '2304x1440'])
                   
# CPU
cpu = st.selectbox(label='CPU', options=df["CpuBrand"].unique())
                   
# HDD
hdd = st.selectbox(label='HDD(in GB)', options=[0, 8, 128, 256, 512, 1024, 2048]) 

#SSD
ssd = st.selectbox(label='SSD(in GB)', options=[0, 8, 128, 256, 512, 1024]) 

# gpu
gpu = st.selectbox(label='GPU', options=df["GpuBrand"].unique())

#OS
os = st.selectbox(label='OS', options=df["OS"].unique())   

if st.button('Predict Price'):
    if touchscreen == 'Yes':
        touchscreen = 1 
    else:
        touchscreen = 0
    
    if ips == 'Yes':
        ips = 1
    else:
        ips = 0
    
    X_res = int(resolution.split('x')[0])
    Y_res =int( resolution.split('x')[1])
    ppi = ((X_res**2) + (Y_res**0.5/screensize))

    query = np.array([company,type,ram,weight,touchscreen,ips,ppi,cpu,hdd,ssd,gpu,os])

    query = query.reshape(1,12)

    predict = pipe.predict(query) [0]

    st.tittle(str(int(np.exp(predict))))



