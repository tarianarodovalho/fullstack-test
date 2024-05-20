# Documentation for InsideTrading App

This application was developed in response to the challenge of implementing an application that would be able to identify and report on insider trading activities using public data, [as seen here](https://github.com/canary-data-com/fullstack-test?tab=readme-ov-file). 

Inside trading refers to the buying or selling of a company's securities by individuals with access to non-public, material information about the company. This app  automates the extraction and analysis of insider trading data from the SEC’s EDGAR database. The criteria used to identify a transaction as an inside trade is the SEC Form4 which must be filed every time an insider performs a transaction, making it public. An insider is any person hired as an officer or director by a company.

The core functionality involves fetching transaction data for various companies from [SEC EDGAR Latest Filings](https://www.sec.gov"/cgi-bin/browse-edgar?action=getcurrent&CIK=&type=4&company=&dateb=&owner=only&start=0&count=1&output=atom), with the selection criteria for these companies being configurable, on the url params. Notice that the params `type=4` defines that the app is looking for the Form4. That request returns an `atom/xml` which is parsed with FeederEx, returning a list of urls that will be used to access the [Filing Details page](https://www.sec.gov/Archives/edgar/data/1305641/000112760224015054/0001127602-24-015054-index.html), of each transaction previously listed. That request returns a `text/html` parsed by Floki which looks for a file with name ending as [form4.xml](https://www.sec.gov/Archives/edgar/data/55135/000112760224015054/form4.xml). We have then the url to request for the `Ownership Document`, a `text/xml` file that will have all the data we need to identify an inside trade.  

After that, the app fetches [the company profile of each company on FinnhubAPI](https://finnhub.io/docs/api/company-profile2) to get the current amount of outstanding shares the company has. Having that information, the application proceeds to calculate the percentage of the total amount of shares that each transaction represents. 

At last the data collected is stored in the database with details such as the company and its ticker, the individual involved, their job title, the date of the report, the number of shares traded, and the percentage these shares represent of the total market capitalization.

As part of the project's extended goals, the system is complemented by a React-based user interface that presents these insights in an accessible format. Unit tests were also created, alongside this comprehensive documentation to ensure reliability and maintainability of the software.

## 1. Setup and Running the Application

### Prerequisites
- Elixir 1.14 or higher
- Phoenix 1.7 or higher
- PostgreSQL 12 or higher
- API key for Finnhub
- User-Agent for SEC Edgar

### Installation Steps
1. 

2. **Visit the application:**
   Open `http://localhost:3000` in your web browser to see the application running.

## 2. API Documentation

### Endpoint: Fetch Latest Filings
- **URL**: `/api/filings`
- **Method**: `GET`
- **Auth required**: No
- **Permissions required**: None

#### Request Parameters:
None

#### Response Body:
```json
{
  "status": "success",
  "data": [
    {
      "ticker": "AAPL",
      "company": "Apple Inc.",
      "owners": [
        {
            "name": "Tim Cook",
            "job_title": "CEO"
        }
      ],
      "report_date": "2024-05-14",
      "amount_of_shares": 500,
      "percentage_of_shares": 0.0003
    }
  ]
}
```

## 3. Design Decisions

### Architecture

The application architecture is structured to promote separation of concerns, modular design, and ease of testing. This architecture aims to make the system easier to navigate and maintain, especially as the codebase grows or as new developers join the project. Here's an overview of the key directories and their roles within the application:

#### `lib/inside_trading/`
- **Integrations (`integrations/`)**:
  - Contains modules that interface with external services, like structured API data.

- **Parsers (`parsers/`)**:
  - Dedicated to processing and transforming raw data fetched from external sources.

- **Scrapers (`scrapers/`)**:
  - Responsible for retrieving data from external websites, like unstructured web contents.

- **Securities (`securities/`)**:
  - Manages the core domain models and business logic related to securities, such as `filing.ex`, `owner.ex`, and `owners_filing.ex`. 

- **Utilities (`utils/`)**:
  - Houses utility functions and helpers that are used across different modules of the application.

- **Workers (`workers/`)**:
  - Contains background jobs and workers that handle asynchronous tasks and operations that need to be run independently of web requests.

#### `lib/inside_trading_web/`
  - **Controllers (`controllers/`)**:
    - Manage web requests and responses.
  
  - **Endpoint (`endpoint.ex`)**:
    - The starting point for all web requests coming into the system.

### Libraries and Tools
- **Phoenix Framework**: For API.
- **React Framework**: For UI.
- **Ecto**: For database integration.
- **HTTPoison**: For making HTTP requests.
- **Floki**: For parsing HTML and XML data.
- **FeederEx**: For  its specialized ability to parse RSS feeds directly, providing built-in functionalities tailored for feed parsing and simplification
- **Hammox**: For testing.

## 4. Future Improvements

### Performance Enhancements
- **Implement caching**: Reduce API request overhead by caching responses, like the Outstanding Shares Amount collected for a ticker on previous filings.
- **Expiration of Older Securities**: If plausible, to maintain data relevance and optimize database performance, implement an expiration mechanism that removes or archives securities entries after a defined period of irrelevance.

### Feature Extensions
- **Websockets for Real-Time Updates**: Use Phoenix Channels to push real-time updates to users when new filings are fetched.
- **Pagination of EdgarScraper calls**: Enhance the EdgarScraper to implement pagination when fetching the latest filings, ensuring that all relevant filings from the last hour are collected, not just the first 100, reducing the risk of missing critical information due to volume limits.

### Code Quality
- **Add Type Specifications**: Typespecs improves code readability and clarity, enhancing maintainability and error-checking capabilities of the code, providing additional safety during compilation, specially considering the application deals with a large amount of extarnal data.

### UI/UX Enhancements
- **Sorting icons**: It is possible to sort the different table columns by alphabetical order by clicking on the column name, however there's no indication of it on the page. Adding sorting icons beside each column name would help users identify the possibility more intuitively.