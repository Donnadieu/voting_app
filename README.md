# Voting App README

## Overview
This README provides an overview of the Voting App, its design, technical aspects, and user experience (UX) decisions.

## Design Decisions
- **UI**: The user interface (UI) is designed to be simple and user-friendly, following a responsive layout using Bootstrap for styling. It provides a clean and organized voting experience.
- **Security**: User email addresses are collected for voting, and a unique email identifier is stored in an encrypted cookie for simplicity, privacy, and tamper resistance. Passwords are assumed to be correct for this exercise.
- **Maximum Candidates and Votes**: The application enforces a maximum of 10 unique candidates and 50 total votes.
- **Voting Time Limit**: Users are allowed 5 minutes to vote after signing in before they need to sign in again.
- **No Predetermined Candidates**: All votes are write-ins, creating new candidates for subsequent voters.
- **Authentication**: While no specific authentication system is integrated, the application assumes user authentication based on email addresses and encrypted cookies.

## Potential Solutions to Unmet Requirements/Extra Credit
- **Authentication System**: To fully implement user authentication, you can integrate a gem like Devise for user management.
- **Real-time Voting**: Implement real-time vote counting and result updates using web sockets or ActionCable.
- **Admin Panel**: Implement an admin panel for vote management and monitoring.
- **Ranked Choice Voting**: Implement ranked choice voting.
- **Email Notifications**: Send email notifications to voters when their votes are counted.
- **Candidate Profiles**: Allow voters to view candidate profiles and information.

## How to Run the Code

To run the Voting App on your local development environment, follow these steps:

### Prerequisites

1. Ensure you have the following installed on your system:
   - Ruby (version 3.0.0 or higher)
   - Ruby on Rails (version 7.0.0 or higher)
   - PostgreSQL (version 13 or higher)

2. Navigate to the root directory of the project.
   ```bash
   cd voting_app
    ```
3. Install the required gems.
    ```bash
    bundle install
    ```
4. Create the database.
    ```bash
    rails db:create
    ```
5. Run the database migrations.
    ```bash
    rails db:migrate
    ```
7. Start the Rails server.
    ```bash
    rails server
    ```
8. Navigate to http://localhost:3000 in your browser to view the application.

9. There 3 main pages in the application:
   - **Home Page**: http://localhost:3000 where you can sign in to vote.
   - **Voting Page**: http://localhost:3000/votes/new where you can vote for and add candidates.
   - **Results Page**: http://localhost:3000/votes where you can view the results of the election.s

10.
