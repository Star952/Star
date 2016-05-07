#include <amxmodx>

new const g_Plugin[] = {"FragVerseny 1.0"};
new const g_Version[] = {"1.0"};
new const g_Author[] = {"Supra:."};

new g_FOlesek[33], g_Nyeremeny[33];
new const Prefix[] = {"FragVerseny"};

public plugin_init()
{
	register_plugin(g_Plugin, g_Version, g_Author);
	
	register_event("DeathMsg", "g_Halal");
}
public g_Halal()
{
	new Gyilkos = read_data(1);
	new Aldozat = read_data(2);
	
	if(Gyilkos != Aldozat)
	{
		if(read_data(3))
		{
			g_FOlesek[Gyilkos] += 2;
		}
		else
		{
			g_FOlesek[Gyilkos] ++;
		}
	}
	g_FOlesek[Aldozat] -= (g_FOlesek[Aldozat] --) ? 1:0;
	
	if(g_FOlesek[Gyilkos] < 50)
	{
		g_FOlesek[Gyilkos] -= 50;
	}
}