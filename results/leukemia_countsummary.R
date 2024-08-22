Sweave("leukemia_countsummary.Rnw");
library(tools);

texi2dvi("leukemia_countsummary.tex",pdf=TRUE);

