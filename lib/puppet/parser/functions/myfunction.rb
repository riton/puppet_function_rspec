module Puppet::Parser::Functions
  newfunction(:myfunction, :type => :rvalue) do |args|


    myfact = lookupvar('myfact')

    raise Puppet::ParseError, ("alway RAISE '#{myfact.to_s}'")

  end
end
