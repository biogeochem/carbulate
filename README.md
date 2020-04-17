carbulate <img src="man/figures/carbulate_logo.png" width="120" align="right" />
================================================================================

This package will calculate the carbonate species (CO2<sub>(aq)</sub>,
HCO<sub>3</sub><sup>-</sup>, CO\_3<sup>2-</sup>) concentrations from a
measured DIC concentration, pH value, and temperature of your water
sample. Values will be added onto the dataframe ‘df’ you supply.

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
water.df &lt;- carbulate(water.df, ‘DIC\_mgC.L’, ‘pH’, ‘Temp\_C’,
‘pressure\_kPa’)

Calculations
------------

Temperature dependent K values were calculated according to the
following references:

*C**O*<sub>2</sub> + *H*<sub>2</sub>*O* ↔ *H**C**O*<sub>3</sub><sup>−</sup> + *H*<sup>+</sup>
 ; Harned & Davis Jr. 1943. Journal of the American Chemical Society 65
(10): p2030-2037.

*H**C**O*<sub>3</sub><sup>−</sup> ↔ *C**O*<sub>3</sub><sup>2−</sup> + *H*<sup>+</sup>
 ; Harned & Scholes Jr. 1941. Journal of the American Chemical Society
63 (6): p1706-1709.

Solubility coefficient of CO<sub>2</sub> in water (Henry’s Law); Harned
& Davis Jr. (1943) and as used in Venkiteswaran et al. 2014. PLoS ONE 9
(7): p22-25. doi: 10.1371/journal.pone.0101756.
