
NAME="local/rhel9.4"
VERSION="9.4"

cat > local_rhel.json << _EOC_
{
  "name": "${NAME}",
  "versions": [
    {
      "version": "${VERSION}",
      "providers": [
        {
          "name": "virtualbox",
          "url": "file://${PWD}/package.box"
        }
      ]
    }
  ]
}
_EOC_

vagrant box add local_rhel.json --name "${NAME}"
vagrant box list           # ⇒ local_rhel (virtualbox, 9.4)

