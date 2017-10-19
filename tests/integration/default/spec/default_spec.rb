require "spec_helper"

class ServiceNotReady < StandardError
end

sleep 10 if ENV["JENKINS_HOME"]

context "after provisioning finished" do
  describe server(:server1) do
    it "install rsync--" do
      result = current_server.ssh_exec("sudo pkg_add rsync-- >/dev/null 2>&1 && echo -n OK")
      expect(result).to eq "OK"
    end
  end
end
