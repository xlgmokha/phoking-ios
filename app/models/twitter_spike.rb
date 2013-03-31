class TwitterSpike
  def run
    @account_repository = ACAccountStore.alloc.init
    @twitter_account_type = @account_repository.accountTypeWithAccountTypeIdentifier ACAccountTypeIdentifierTwitter
    @account_repository.requestAccessToAccountsWithType @twitter_account_type, options:nil, completion: lambda { |granted, error|
      if granted
        @accounts = @account_repository.accountsWithAccountType @twitter_account_type
        p "ID: #{@accounts.first.accountProperties['user_id']} #{@accounts.first.username}"

        puts "GRANTED ACCESS"
      else
        puts "NOT GRANTED"
      end
    }
  end
end
