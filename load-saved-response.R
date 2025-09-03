library(httr)
library(jsonlite)
# Load saved response
load(file = "results/SP-models-in-NIMBLE-response.RData")
save_response_as_qmd(response, "results/SP-models-in-NIMBLE_test.qmd")
