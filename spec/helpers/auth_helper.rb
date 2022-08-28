def sign_in(account)
  request.env["rodauth"] = Rodauth::Rails.rodauth(account:)
end
