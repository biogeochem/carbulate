#' Calculate Carbonate Speciation using DIC, pH, and Temperature
#'
#' This function calculates the speciation of dissolved inorganic carbon given the measured pH, DIC concentration, and water temperature.
#' It will add on the concenrations of each carbonate species (CO2(aq), HCO3-, CO3--) to your dataframe 'df'.
#' @keywords DIC carbonate speciation
#' @author Pieter J. K. Aukes
#' @param df Your dataframe with parameters of interest
#' @param DIC_col_mg.L Name of column that contains your measured dissolved inorganic carbon concentration (mgC/L)
#' @param pH_col Name of column with your measured pH
#' @param temp_col_C Name of column with your measured water temperature (in celsius)
#' @param pressure_kPa Name of column with the field atmospheric pressure (in kPa)
#' @examples
#' water.df <- carbulate(water.df, 'DIC_mgC.L', 'pH', 'Temp_C')



carbulate <- function(df, DIC_col_mg.L, pH_col, temp_col_C, pressure_col_kPa){

  # conversion calculations:
  DIC_uM <- df[[DIC_col_mg.L]] * (1000/12.01);
  temp_K <- df[[temp_col_C]] + 273.15;
  h_uM   <- 10^ -df[[pH_col]];
  P_atm  <- df[[pressure_col_kPa]] * 0.00986923;

  # temp. dependent K values
  K1 <- 10^((-3404.71/temp_K)+14.8435-(0.032786*temp_K));                     #CO2 + H2O <=> HCO3- + H+ ; Harned & Davis, 1943
  K2 <- 10^((-2902.39/temp_K)+6.498-(0.02379*temp_K));                        #HCO3- <=> CO3-- + H+ ; Harned & Scholes Jr, 1941
  Kw <- 10^(log10(exp(148.9802-(13847.26/temp_K)-(23.6521*log10(temp_K)))));  #H2O <=> H+ + OH-
  K0 <- 10^(-((-2385.73/temp_K)+14.0184-(0.0152642*temp_K)));                 #sol coeff of CO2 in water (Henry's Law); Harned & Davis, 1943 (as used in Venkiteswaran et al. PLOS ONE)

  #speciation calculations:
  df$calc_CO2_uM <-  DIC_uM / (1 + (K1/h_uM) + (K1 * (K2/(h_uM^2)) ) );

  df$calc_HCO3_uM <- DIC_uM / (1 + (h_uM/K1) + (K2/h_uM));

  df$calc_CO3_uM <-  DIC_uM / ( ( (h_uM^2)/(K1*K2) ) + (h_uM/K2) + 1);

  df$calc_carb_alk_uM <- df$calc_HCO3_uM + 2*df$calc_CO3_uM;

  df$calc_pCO2_uatm <- df$calc_CO2_uM / K0;

  df$calc_pCO2_perc_sat <- ( (df$calc_CO2_uM / 10^6) / (K0 * ((410*10^-6) * P_atm) ) ) * 100;

  return(df)

}
