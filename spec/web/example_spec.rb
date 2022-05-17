# RSpec.describe "Example Requests" do
#   describe "GET /example" do
#     xit "responds with an example text" do
#       get '/example'
#       expect(last_response.body).to eq "This is an example response.\n"
#     end
#   end

#   describe "POST /example" do
#     xit "responds with an example text" do
#       post '/example', 'hello=world&happy=days'
#       expect(last_response.body).to eq(
#         "Thanks for the POST request to /example.\n\n" +
#         "Your params were:\n{\"hello\"=>\"world\", \"happy\"=>\"days\"}\n\n" +
#         "Try changing the request and see what happens.\n"
#       )
#     end
#   end

#   describe "PATCH /example" do
#     xit "responds with an example text" do
#       patch '/example/99', 'hello=world&happy=days'
#       expect(last_response.body).to eq(
#         "Thanks for the PATCH request to /example/99.\n\n" +
#         "Your params were:\n{\"hello\"=>\"world\", \"happy\"=>\"days\", \"id\"=>\"99\"}\n\n" +
#         "See how the `:id` in the URL got into that list?\n" +
#         "Try changing the request and see what happens.\n"
#       )
#     end
#   end

#   describe "DELETE /example" do
#     xit "responds with an example text" do
#       delete '/example/99'
#       expect(last_response.body).to eq(
#         "Thanks for the DELETE request to /example/99.\n\n" +
#         "Your params were:\n{\"id\"=>\"99\"}\n\n" +
#         "Try changing the request and see what happens.\n"
#       )
#     end
#   end
# end

# # EXAMPLE ROUTES

#   # Try: `curl localhost:9292/example`
#   get '/example' do
#     return "This is an example response.\n"
#   end

#   # Try: `curl -X POST -d "hello=world&happy=days" localhost:9292/example`
#   post '/example' do
#     output = "Thanks for the POST request to /example.\n\n"
#     output += "Your params were:\n"
#     output += params.to_s
#     output += "\n\nTry changing the request and see what happens.\n"
#     return output
#   end

#   # Try: `curl -X PATCH -d "hello=world&happy=days" localhost:9292/example/99`
#   patch '/example/:id' do
#     output = "Thanks for the PATCH request to /example/#{params[:id]}.\n\n"
#     output += "Your params were:\n"
#     output += params.to_s
#     output += "\n\nSee how the `:id` in the URL got into that list?\n"
#     output += "Try changing the request and see what happens.\n"
#     return output
#   end

#   # Try: `curl -X DELETE localhost:9292/example/99`
#   delete '/example/:id' do
#     output = "Thanks for the DELETE request to /example/#{params[:id]}.\n\n"
#     output += "Your params were:\n"
#     output += params.to_s
#     output += "\n\nTry changing the request and see what happens.\n"
#     return output
#   end
