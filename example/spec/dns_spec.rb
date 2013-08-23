require 'spec_helper'

update_config({ :nameserver => ['8.8.8.8'] })

describe 'github.com' do
  it { should have_dns.with_type('A').and_address('192.30.252.128') }
  it { should have_dns.with_type('A').and_address('192.30.252.129') }
  it { should have_dns.with_type('A').and_address('192.30.252.130') }
  it { should have_dns.with_type('A').and_address('192.30.252.131') }
  it { should have_dns.with_type('A').and_address('204.232.175.90') }
  it { should have_dns.with_type('A').and_address('207.97.227.239') }

  it { should have_dns.with_type('MX').and_exchange('ASPMX.L.GOOGLE.com'      ).and_preference(10) }
  it { should have_dns.with_type('MX').and_exchange('ALT1.ASPMX.L.GOOGLE.com' ).and_preference(20) }
  it { should have_dns.with_type('MX').and_exchange('ALT2.ASPMX.L.GOOGLE.com' ).and_preference(20) }
  it { should have_dns.with_type('MX').and_exchange('ASPMX2.GOOGLEMAIL.com'   ).and_preference(30) }
  it { should have_dns.with_type('MX').and_exchange('ASPMX3.GOOGLEMAIL.com'   ).and_preference(30) }

  it { should have_dns.with_type('NS').and_name('ns1.p16.dynect.net') }
  it { should have_dns.with_type('NS').and_name('ns2.p16.dynect.net') }
  it { should have_dns.with_type('NS').and_name('ns3.p16.dynect.net') }
  it { should have_dns.with_type('NS').and_name('ns4.p16.dynect.net') }

  it { should have_dns.with_type('TXT')\
      .and_data('v=spf1 include:_spf.google.com include:_netblocks.zdsys.com include:sendgrid.net include:mailgun.org include:smtp.github.com ~all') }

  it { should have_dns.with_type('SOA').and_mname('ns1.p16.dynect.net') \
      .and_rname('hostmaster.github.com')\
#     .and_serial('1376705002')\
      .and_refresh(3600).and_retry(600).and_expire(604800).and_minimum(60) }
end
