require "spec_helper"
require "serverspec"

config  = "/etc/installurl"
url = "https://fastly.cdn.openbsd.org/pub/OpenBSD"

describe file(config) do
  it { should be_file }
  its(:content) { should match Regexp.escape(url) }
end
