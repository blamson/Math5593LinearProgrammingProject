from amplpy import AMPL
from amplpy import DataFrame as AMPLDataFrame
import pandas as pd

ampl = AMPL()

df = pd.read_csv("data/mtcars.csv")
# print(df.head())

df = df.set_index('model')
adf = AMPLDataFrame.from_pandas(df)
# print()

ampl.read("models/mtcars.mod")
ampl.set_data(adf, "MODELS")
ampl.eval("display mpg;")

# ampl.eval("set CAR;")

# ampl.eval("param mpg{CAR};")

# predictors = [c for c in df.columns if c not in ["model", "mpg"]]
