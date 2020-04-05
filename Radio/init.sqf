//disabling all channels

DisablingChannels ={

	1 enableChannel  false;
	2 enableChannel  false;
	4 enableChannel  false;

};


SetupList = {

	SignedInComs = [];

};

[] remoteExec["SetupList",2];
[] remoteExec["DisablingChannels", 0];