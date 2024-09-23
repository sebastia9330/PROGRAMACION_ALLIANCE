import pandas as pd

mercado_file = 'MERCADO.xlsx'

df = pd.read_excel(mercado_file, """sheet_name = 1""")

df.to_csv('mercadocsv.csv', index=False, encoding='utf-8')