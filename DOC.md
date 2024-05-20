# Documentation for InsideTrading App

This application was developed in response to a challenge to identify and report on insider trading activities using public data. Inside trading refers to the buying or selling of a company's securities by individuals with access to non-public, material information about the company. While such activities can be legal if properly disclosed to the Securities and Exchange Commission (SEC), they require careful monitoring. Our solution automates the extraction and analysis of insider trading data from the SEC’s EDGAR database.

The core functionality involves fetching transaction data for various companies, with the selection criteria for these companies being configurable. For each transaction, the application records details such as the ticker/company, the individual involved, their job title, the date of the transaction, the number of shares traded, and the percentage these shares represent of the total market capitalization, utilizing financial data APIs like Yahoo Finance for market cap information.

As part of the project's extended goals, the system is complemented by a React-based user interface that presents these insights in an accessible format, alongside unit tests and comprehensive documentation to ensure reliability and maintainability of the software.

## 1. Setup and Running the Application

### Prerequisites
- Elixir 1.12 or higher
- Phoenix 1.6 or higher
- PostgreSQL 12 or higher
- API keys for Finnhub and other used services

### Installation Steps
1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/insidetrading.git
   cd insidetrading
   ```

2. **Install dependencies:**
   ```bash
   mix deps.get
   ```

3. **Create and migrate your database:**
   ```bash
   mix ecto.create && mix ecto.migrate
   ```

4. **Add environment variables:**
   Create a `.env` file in the root directory and add the necessary API keys and database configuration:
   ```plaintext
   export FINNHUB_API_KEY="your_finnhub_api_key"
   export DATABASE_URL="ecto://user:pass@localhost/insidetrading_dev"
   ```

5. **Run the application:**
   ```bash
   source .env
   mix phx.server
   ```

6. **Visit the application:**
   Open `http://localhost:4000` in your web browser to see the application running.

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
- **Phoenix Framework**: For web interface and API.
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
- **Continuous Integration**: Set up CI pipelines to run tests, lint code, and ensure quality before merges into main branches.
- **Add Type Specifications**: Typespecs improves code readability and clarity, enhancing maintainability and error-checking capabilities of the code, providing additional safety during compilation, specially considering the application deals with a large amount of extarnal data.
