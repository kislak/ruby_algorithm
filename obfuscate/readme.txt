gem install obfuscate
Ruby Usage

A simple example

Obfuscate.setup do |config|
  config.salt = "A weak salt ..." # Length must be between 1-56 
  config.mode = :string           # defaults to :string
end

obfuscated = Obfuscate.obfuscate( "test" )   # "HoDruKtafqyLxZxu9s-kYQ=="
clarified = Obfuscate.clarify( obfuscated )  # "test"
