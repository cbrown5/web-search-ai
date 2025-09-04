# Script for web searches using the OpenRouter API and saving the response as a Quarto markdown file.
# CJ Brown 2025 
#
# Tips: Keep the user message short and specific for best results. 
# The user message is used in the web search.
# Use the system message to set the context and rules for the report writing. The system messsage is not used in the web search. 

# Suggested models
# "perplexity/sonar-deep-research"  best for long detailed reports, cost typically USD0.5
# "perplexity/sonar"  good for shorter reports, cost typically USD0.01. No reasoning used

library(httr)
library(jsonlite)

source("perplexity-search-functions.R")

openrouter_api_key <- Sys.getenv("OPENROUTER_API_KEY")



# Example of standard web search query

if (FALSE) {
user_message <- "What types of biases occur in fisheries stock models?"

system_message <- "You are a helpful AI assistant. 
        Rules: 
        1 Include the DOI in your report of any paper you reference.   
        2. Produce reports that are less than 10000 words."

}

# Example of generating an R tutorial 

if (FALSE){

user_message <- "How could I perform a yield per recruit analysis in the R program?"

system_message <- "You are a helpful AI agent who creates statistical analysis tutorials in R. 
        Rules: 
        1. Include text and examples of code in your responses. 
        2. Produce reports that are less than 10000 words."
}


response <- call_openrouter_api(
  openrouter_api_key,
  model = "perplexity/sonar-deep-research",
  system_message = system_message,
  user_message,
  search_context_size = "medium"
  #Options "low"  "medium", "high"
)

# Example usage:
save_response_as_qmd(response, "results/results.qmd")


