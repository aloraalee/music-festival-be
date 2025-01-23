# Music Festival Schedule Service Backend

## Description
This Rails API serves as the backend for the Music Festival Schedule Service. It provides endpoints for managing music festival schedules, shows, and users.

## Ruby and Rails versions
- Ruby 3.1.1
- Rails 7.0.4

## System dependencies
- PostgreSQL

## BE Installation
1. Clone the BE repository: https://github.com/aloraalee/music-festival-be.git
2. Navigate to the project directory
3. Set up the database: 
### `rails db:create db:migrate db:seed`
## Usage
To start the server:
### `rails s`

## FE Installation
1. Clone the FE repository: https://github.com/aloraalee/music-festival-fe.git
2. Navigate to the project directory:
## Usage
### `npm start`

The API will be available at `http://localhost:3000`.

## API Endpoints
- GET /api/v1/schedules - Retrieve all festival schedules
- GET /api/v1/schedules/:id - Get detailed information about a specific schedule, including associated shows and users
- DELETE /api/v1/schedules/:schedule_id/remove_shows/:show_id - Remove a show from a specific schedule

## Database Structure


## Testing
This project uses RSpec for testing. To run the tests:
### `bundle exec rspec`

