## 概要

- VirtualBox上のUbuntu-22.04にRedmineとSQLServerを作成します。
- Redmine環境構築には https://github.com/yoshinorin/docker-redmine-orchestration を使用しています。

## 動作確認

- Vagrant 2.3.4
- VirtualBox 6.1.42

## 実行方法

### 1. `up.bat`を実行

### 2. 192.168.0.99 で実行

```bash
root$ cd /vagrant/ansible
root$ ansible-playbook site.yml
```

### 3. https://192.168.0.99:3000/ へアクセス

- オレオレ証明書 `oreore\daieihawks.crt`をブラウザにインポートしておいてください。

## メモ

### Vagrantfile

```yaml
# ブリッジアダプター名を環境に合わせて変えてください
config.vm.network "public_network", ip: "192.168.0.99", bridge: "Intel(R) Ethernet Connection (6) I219-V"
```
