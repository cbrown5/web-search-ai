library(httr)
library(jsonlite)

source("web-search-ai/perplexity-search-functions.R")

openrouter_api_key <- Sys.getenv("OPENROUTER_API_KEY")
user_message <- "I want to learn how to use the NIMBLE package to fit basic surplus production models in R and more complex models with  environmentally correlated process errors"

response <- call_openrouter_api(
  openrouter_api_key,
  model = "perplexity/sonar-deep-research",
  system_message = "You are a helpful AI agent who creates statistical analysis tutorials in R. 
        Rules: 
        1. Include text and examples of code in your responses. 
        2. Produce reports that are less than 10000 words.",
  user_message,
  search_context_size = "medium"
  #Options "low"  "medium", "high"
)

save(response, file = "web-search-ai/results/SP-models-in-NIMBLE-response.RData")


# Example usage:
save_response_as_qmd(response, "web-search-ai/results/SP-models-in-NIMBLE.qmd")


#
# Old code
#

#example: 
# load( file = "web-search-ai/results/inla-tute-response.RData")

# POST request with websearch JSON with perplexity model
openrouter_api_key <- Sys.getenv("OPENROUTER_API_KEY")

user_message <- "I want to learn how to use INLA and the R program to fit a spatial model to a multivariate response, where each variable is sampled at different locations"

response <- POST(
  url = "https://openrouter.ai/api/v1/chat/completions",
  add_headers(
    "Content-Type" = "application/json",
    "Authorization" = paste("Bearer", openrouter_api_key)
  ),
  body = toJSON(list(
    model = "perplexity/sonar",
    messages = list(
      list(
        role = "system",
        content = "You are a helpful AI agent who creates statistical analysis tutorials in R. 
        Rules: 
        1. Include text and examples of code in your responses. 
        2. Produce reports that are less than 5000 words. 
        "
      ),  
      list(
        role = "user",
        content = user_message
      )
    ),
    web_search_options = list(
      search_context_size = "medium"
    )
  ), auto_unbox = TRUE),
  encode = "raw"
)
# save(response, file = "web-search-ai/results/inla-tute-response.RData")

# Example usage:
save_response_as_qmd(response, "web-search-ai/results/inla-tute-output2.qmd")
