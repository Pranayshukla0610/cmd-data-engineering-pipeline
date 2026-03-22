import pandas as pd
import os

input_path = 'data/raw/olist.csv'
output_path = 'data/processed/cleaned_olist.csv'

if not os.path.exists(input_path):
    print("File not found!")
    exit(1)

df = pd.read_csv(input_path)

print("Original:", df.shape)

df = df.dropna()

print("After cleaning:", df.shape)

os.makedirs('data/processed', exist_ok=True)
df.to_csv(output_path, index=False)

print("Transformation complete!")