require "spec_helper"
require "serverspec"

config = "/etc/installurl"
url = "https://fastly.cdn.openbsd.org/pub/OpenBSD"

describe file(config) do
  it { should exist }
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by "root" }
  it { should be_grouped_into "wheel" }
  its(:content) { should match Regexp.escape(url) }
end
