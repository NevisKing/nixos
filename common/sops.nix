{inputs, config, ...}:
{
imports = [ 
inputs.sops-nix.nixosModules.sops
];

sops.defaultSopsFile = ../secrets.yaml;
sops.validateSopsFiles = false;

sops.age = {
	sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
	keyFile = "/var/lib/sops-nix/key.txt";
	generateKey = true;
};

sops.secrets = {
vpnacc = {owner = "nevis";};
sshpub = {owner = "nevis";};
serverIp = {owner = "nevis";};
};

environment.sessionVariables = {
	dog = "moosa";
	key = config.sops.secrets."sshpub".path;
	key2 = "$(cat ${config.sops.secrets."sshpub".path})";
	b = "$(cat ${config.sops.secrets."vpnacc".path})";
};
environment.variables = {
	key3 = "$(cat ${config.sops.secrets."sshpub".path})";
};
}
