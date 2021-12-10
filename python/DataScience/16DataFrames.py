import pandas as pd

wine_dict = {
    'red_wine': [3, 6, 5],
    'white_wine':[5, 0, 10]
}
sales = pd.DataFrame(wine_dict, index=["adam", "bob", "charles"])
print(sales)

#####################################

import pandas as pd

wine_dict = {
    'red_wine': [3, 6, 5],
    'white_wine':[5, 0, 10]
}
sales = pd.DataFrame(wine_dict, index=["adam", "bob", "charles"])
print(sales['white_wine'])