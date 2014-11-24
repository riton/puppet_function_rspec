#! /usr/bin/env ruby -S rspec

require 'spec_helper'

describe 'myfunction', :type => :puppet_function do

  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  describe 'with fact available' do

    let(:facts) do {
      :myfact => 'RedHat'
    }
    end

    # First way to do it
    it "shouldn't fail with call()" do
      expect {
        subject.call([])
      }.to raise_error(Puppet::ParseError, /alway RAISE 'RedHat'/)
    end

    # other way to do it according to
    # https://github.com/rodjek/rspec-puppet#specifying-the-arguments-to-pass-to-the-function
    it "shouldn't fail with run()" do
      should run.and_raise_error(Puppet::ParseError, /alway RAISE 'RedHat'/)
      #should run.with_params().and_raise_error(Puppet::ParseError, /alway RAISE 'RedHat'/)
    end

   end

end

# vim: tabstop=2 shiftwidth=2 softtabstop=2
