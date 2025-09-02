# R scripts for accessing Openrouter

With specialize focus on using perplexity's search models. 

Chris J. Brown

`ellmer` is a great package if you want to do API calls to LLM providers. However, they often don't keep up with latest model developments (I made this because ellmer didn't return the references for perplexity calls). In here are some handy functions that can be modified to make API calls directly with `httr`, which lets you customize the JSON to the most up to date features. 

