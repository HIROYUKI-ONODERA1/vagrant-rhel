# Vagrantfile.tpl  (Go text/template)

Vagrant.configure("2") do |config|
  # Box 名は Packer 側で埋め込まれる
  config.vm.box = "{{ .BoxName }}"

  # 共有フォルダを無効化（サーバ用途ならシンプル）
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Provider 別カスタマイズ
  {{- if eq .Provider "virtualbox" }}
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus   = 2
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end
  {{- end }}

  # 初回起動時に最小限の update を実行
  #config.vm.provision "shell", inline: <<-SHELL
  #  sudo dnf -y update
  #SHELL
end

