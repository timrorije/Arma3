class camViewer{
	idd =1234;
	class controls{
		class mainFrame: RscFrame
		{
			idc = 1800;
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.038 * safezoneH + safezoneY;
			w = 0.861094 * safezoneW;
			h = 0.88 * safezoneH;
		};
		class listBox1: RscListbox
		{
			idc = 1500;
			x = 0.577343 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.407 * safezoneH;
			onLBSelChanged = "[_this] execVM 'changeView1.sqf'" ; 
		};
		class listBox2: RscListbox
		{
			idc = 1501;
			x = 0.164844 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.396 * safezoneH;
			onLBSelChanged = "[_this] execVM 'changeView2.sqf'"
		};
		class view1: RscPicture
		{
			idc = 1200;
			text = "#(argb,512,512,1)r2t(Nothing,1)";
			x = 0.164844 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.407344 * safezoneW;
			h = 0.407 * safezoneH;
		};
		class view2: RscPicture
		{
			idc = 1201;
			text = "#(argb,512,512,1)r2t(timro_cam,1)";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.407344 * safezoneW;
			h = 0.407 * safezoneH;
		};
	};

};