# PoliRant

PoliRant-

Description:
          In many online community groups and in personal discussion, many people share their concerns, thoughts and suggestions involving various aspects of their local community/neighborhood. However, often these ideas are expressed and go no further than that; researching who to express these concerns to in order to make an impact can seem overwhelming or fruitless …enter PoliRant.
          PoliRant gives community members a resource to connect them with those in elected office, and help them become involved in initiating change by addressing community concerns.

 Goal:
      Personal Learning Goals:
               Become more comfortable with APIs, Rails and design & formatting languages (HTML, CSS and Bootstrap).

  Tech/Frameworks used?
               The technology I’ll be using is Ruby on Rails, HTML, CSS, Bootstrap, and OmniAuth

               The frameworks I’ll be using are Civic Information API

               The pattern I’ll be using is ActiveRecord

  Tech Skills/Dependencies?
               Be able to utilize the above mentioned technologies, frameworks and pattern.

  What does success look like? Done?
          Honestly, 10-15 won’t be enough time to get this project done completely. In the future I hope to integrate the ability to actually send the message via the app when the form is submitted. But for now, I will focus on creating a user friendly interface, and accessing info from the Civic Information API to point users in the right direction; depending on time and accessibility to information, a user would be directed to a representative depending on the category they choose (infrastructure, education, housing, etc.)
          The Civic Information API has been used by change.org for petitions, but unlike petition sites, PoliRant is a personal letter from you to your representatives, and you don’t have to create a public petition or get involved with only those causes that already exist.
           Upon agreeing to create a rant, a user would be informed that all rants not include cuss words. In the future I would to utilize a technology (perhaps textio) that scans the user’s “rant” for any cuss words and refuses to submit the form to the representative until they adjust the language; let’s keep it civil, people. I do think interaction between individuals should be respectful; and also, I really appreciate how this raw and honest expression of the people of the  community to the representatives could shift awareness and create dialogues.
          I feel like there would be other factors to consider about the “rants” if it were to go live and actually send the rant to the representative
          If I get time, I would like to add the ability to display the saved “rant” if the user chooses and allow people to comment or “like” it in order to provide “ditto” emails to be sent to the representative. It’s kind of like petitioning but a bit more persistent, and therefore I believe will really drive the point home that people in this community want to be involved in change and they really care, if we only give them the right resource to channel that energy.

Learning Goals:
           Become more comfortable with APIs, Rails and design & formatting languages (HTML, CSS and Bootstrap).

User Stories
     Guest
               Can Do:
                    -  Sign up/ Sign in
                    -  Search for representatives of your district

               Can’t Do:
                    -  Send a “rant"

      User
                 Can Do:
                    -  Sign In/ Sign out
                    -  Search for representative of your district
                    -Choose a category for a “rant"
                    -  Send a “rant"
                    -  See my account page

                Can’t Do:
                    -  Sign up

Deliverables

          Models

              User: A signed-in user account, created via OmniAuth

                    Validations:

                        -  uid must be a string, and must be present
                        - Username must be a string, must be unique and must be present
                        - Name must be a string, and must be present
                        - Email must be a string, must be unique, and must be present
                        - Password confirmation must match Password

             Rants: Collection of rant associated with a User

                    Validations:

                        -  uid must be a string, and must be present
                        - rant must be a string, and must be present

             Contact_info:  A plain Ruby object that receives and models data retrieved from the Civic Information API.
                    Validations:

                        - Name must be a string, and must be present
                        - phone_number must be a string
                        - address must be a string
                        - email address must be a string
                        - level must be a string
                        - scope must be a string
                        - party must be a string
                        - url must be a string

          API Wrapper
                       - CivicInfoWrapper -Wraps interactions with the Civic Information API by leveraging the HTTParty gem. Should reside in lib/.

          Controllers

                    Sessions
                           Actions
                                   - new: shows a view with OAuth sign-in link
                                   - create:  accepts OAuth information from Spotify, finds or creates a User account, and sets user_id in session
                                   - destroy: deletes user_id from session
                   Rants
                           Actions
                                   - new: shows a new rant form
                                   - create: creates a new rant instance from submitted form info
                                   - destroy: deletes a rant…this may not be an option once the site is live and actually connects to an rant/email recipient.
                    Users
                            Actions
                                   - show: displays user info
                                   -show rants: displays user’s rants

                    Contact_info
                          Actions
                                   -find: finds the correct representative for a given district
                                   -show: displays the info received from the HTTParty call to the Wrapper

          Views
                    Sessions
                              - /sign_in
                                   - displays log-in page

                    Layout
                              - On all pages, if not signed in:
                                   - Displays Guest
                                   - Displays link to sign-in page

                              - On all pages, if signed in:
                                   -Displays user name
                                   - Displays link to sign-out

                    User
                              - Index
                                   - Displays account info ( username, name, email address )
                                   - Displays rants
                              -  _rants (partial)
                                   - This is the HTML representation of a single rant
                                   - Displays contents of rant, saved as a string you can update.
                                   - Displays the contacted representative for each rant
                     Rant
                              -Index
                                   - Displays form for said rant


Resources

Civic Information API - https://developers.google.com/civic-information/

Trello Board -  https://trello.com/b/R2vySxVe/polirant



