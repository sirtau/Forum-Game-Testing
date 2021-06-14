
def get_random_joke
    random_joke_api = 'https://geek-jokes.sameerkumar.website/api?format=json'
    random_joke_response = HTTParty.get( random_joke_api )
    responseJSON = random_joke_response.body
    responseHash = JSON.parse(responseJSON);
    
    return responseHash["joke"]
end


