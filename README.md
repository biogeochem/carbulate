carbulate
=========

This package will calculate the carbonate species (CO2(aq), HCO3-, CO3–)
concentrations from a measured DIC concentration, pH value, and
temperature of your water sample. Values will be added onto the
dataframe ‘df’ you supply.

Parameters
----------

carbulate(df, ‘DIC\_col\_mg.L’, ‘pH\_col’, ‘temp\_col\_C’,
‘pressure\_kPa’)

df - your dataframe that contains all the variables  
DIC\_col\_mg.L - Name of the column that contains the measured dissolved
inorganic carbon concentration (mg C/L)  
pH\_col - Name of column with your measured pH  
temp\_col\_C - Name of column with your measured water temperature (in
Celsius)  
pressure\_kPa - Name of column with the atmospheric pressure where the
sample was collected from (in kPa)

Example
-------

This is how you would input this function to add the carbonate species
to the dataframe ‘water.df’:  
water.df &lt;- carbulate(water.df, ‘DIC\_mgC.L’, ‘pH’, ‘Temp\_C’)
