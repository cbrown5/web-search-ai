
# web-search-ai: R Scripts for OpenRouter & Perplexity API

This project provides R scripts for accessing the [OpenRouter API](https://openrouter.ai/), with a focus on using Perplexity’s search models to get AI to generate reports. 

## Features

- **Direct API calls** using `httr` for maximum flexibility and up-to-date model support.
- **Support for any model on Openrouter** (e.g., `perplexity/sonar`, `perplexity/sonar-deep-research`).
- **Automated citation handling:** Extracts and links references from AI responses.
- **Quarto Markdown output:** Saves AI responses as `.qmd` files, including references and reasoning sections.
- **Easily customizable** system/user prompts and model selection.

## Main Scripts

- `do-web-search.R`: Example workflow for making a query, calling the API, and saving the result as a Quarto Markdown file.
- `perplexity-search-functions.R`: Core functions for API interaction and response processing, including citation and reference handling.

## Usage

1. **Set your API key:**
	- Obtain an API key from [OpenRouter](https://accounts.openrouter.ai/sign-up).
	- Set it as an environment variable: `OPENROUTER_API_KEY` (In R you can do  `usethis::edit_r_environ()` then create a line for your API key there). 

2. **Edit your query:**
	- In `do-web-search.R`, set the `user_message` variable to your desired question or topic.

3. **Run the script:**
	- Execute `do-web-search.R` in R. The script will call the API and save the output as a Quarto Markdown file in the `results/` directory.

4. **View the results:**
	- Open the generated `.qmd` file in Quarto or as HTML after rendering.

## Dependencies

- R packages: `httr`, `jsonlite`

Install them with:

```r
install.packages(c("httr", "jsonlite"))
```

## Model advice

`perplexity/sonar` For a simpler, cheaper searches, including citations. 
`perplexity/sonar-deep-research` For deeper, more expensive searches with citations and reasoning. 

`openai/o4-mini` Is another option, but doesn't return citations. 

## Customization

- You can modify the system message, user message, or model in `do-web-search.R` for different use cases.
- The functions in `perplexity-search-functions.R` can be adapted for other LLM providers or custom workflows.

## Author

Chris J. Brown

---
*Note: This project was created to provide more flexible and up-to-date access to LLM APIs than existing packages like `ellmer`, especially for features like citation extraction from Perplexity models.*

