message = "Welcome to Prehave! I can help simplify your social media accounts"
@client.messages.create(from: ENV['APP_SYSTEM_PHONE'], to: "19493228496", body: message)

message = "Login using this link: "
@client.messages.create(from: ENV['APP_SYSTEM_PHONE'], to: "19493228496", body: message)
message = "http://prehave.com/53af3dg?flow=19493228496"
@client.messages.create(from: ENV['APP_SYSTEM_PHONE'], to: "19493228496", body: message)

message = "Got it! Welcome Lenny!"
@client.messages.create(from: ENV['APP_SYSTEM_PHONE'], to: "19493228496", body: message)

message = 'How do you want to start? I can respond to the following commands: "summary", "focus", "engage", "followers", "options"'
@client.messages.create(from: ENV['APP_SYSTEM_PHONE'], to: "19493228496", body: message)

message = 'Ill pull up your summary'
@client.messages.create(from: ENV['APP_SYSTEM_PHONE'], to: "19493228496", body: message)

message = 'Yesterday, you posted two pictures and received over 600 comments. 22.4% of your comments are from users who have never engaged with you before. 61.9% of the comments had a positive sentimate, while 15.8% had a negative sentimate.'
@client.messages.create(from: ENV['APP_SYSTEM_PHONE'], to: "19493228496", body: message)

message = '39 comments contained a question. Here is one highlight from a high-value follower.'
@client.messages.create(from: ENV['APP_SYSTEM_PHONE'], to: "19493228496", body: message)

@client.messages.create(from: ENV['APP_SYSTEM_PHONE'], to: "19493228496", body: "", media_url: "http://i.imgur.com/vdzHwcH.png")



message = 'Say "more" to see additional details.'
@client.messages.create(from: ENV['APP_SYSTEM_PHONE'], to: "19493228496", body: message)



message = '.'
@client.messages.create(from: ENV['APP_SYSTEM_PHONE'], to: "19493228496", body: message)