# How to 'franchise' this project for use for others?

1. Create TEAM table
    - Team name
    - invite code ... special code to send to invitees
    - some label stuff, tbdd
1. Add TEAM link to user table
1. Modify Registration view+controller, Create logic:
    - add the following to register-new-user view:
        - Option: - create new team or join existing team -
        - if create new - display field for team name
        - if join-existing, display invite code field
    - in CREATE method:
        - if they chose create new team:
            - create team record, associate user to it, set user.admin = true
            - generate guid invite code + store w/ team record
        - if they chose join existing:
            - validate appropriate invite code received
            - if so, create user, associate it to team record
1. Make use of team name everywhere
    - set navigation window to show team name
    - bonus, set all routes to be kentflix.com/teamname
1. Add TEAM link to Movies table
1. On create of movie, team is set to current_user.team
1. Add scope for movie model to only show movies for current team


_Note, we're still "Movies", but in the future this could be anything needing check-in/check-out feature._

